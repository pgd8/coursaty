import 'dart:async';
import 'package:camera/camera.dart';
import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/features/user/prsentation/manager/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(CameraInitial());
  CameraController? cameraController;
  late FaceDetector faceDetector;
  bool _isProcessing = false;
  bool _isCameraClosed = false;
  void initializeFaceDetector() {
    faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: true,
        enableLandmarks: true,
        enableTracking: true,
        enableClassification: true,
        performanceMode: .accurate,
      ),
    );
  }

  Future<void> initializeCamera() async {
    _isCameraClosed = false; // ✅ reset

    emit(CameraLoading());
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );
      cameraController = CameraController(
        frontCamera,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.nv21,
      );
      await cameraController!.initialize();
      await cameraController!.startImageStream(processCameraImage);
      emit(CameraOpened(cameraController!));
    } catch (e) {
      emit(CameraError(e.toString()));
    }
  }

  Future<void> processCameraImage(CameraImage image) async {
    if (_isProcessing || _isCameraClosed) return;

    if (cameraController == null ||
        !cameraController!.value.isInitialized ||
        !cameraController!.value.isStreamingImages) {
      return;
    }

    _isProcessing = true;

    try {
      final camera = cameraController!.description;

      final imageRotation =
          InputImageRotationValue.fromRawValue(camera.sensorOrientation) ??
          InputImageRotation.rotation0deg;

      final inputImageFormat =
          InputImageFormatValue.fromRawValue(image.format.raw) ??
          InputImageFormat.nv21;

      final inputImage = InputImage.fromBytes(
        bytes: image.planes.first.bytes,
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: imageRotation,
          format: inputImageFormat,
          bytesPerRow: image.planes.first.bytesPerRow,
        ),
      );

      // ✅ Run ML Kit
      final faces = await faceDetector.processImage(inputImage);

      // ✅ Prevent using results after dispose
      if (_isCameraClosed || cameraController == null) return;

      final validFaces = faces.where((face) => isValidFace(face)).toList();

      if (validFaces.isNotEmpty) {
        emit(
          FaceDetected(
            faces: validFaces,
            imageSize: Size(image.width.toDouble(), image.height.toDouble()),
          ),
        );
      } else {
        emit(FaceNotDetected());
      }
    } catch (e) {
      if (!_isCameraClosed) {
        emit(CameraError(e.toString()));
      }
    } finally {
      _isProcessing = false;
    }
  }

  bool isValidFace(Face face) {
    final rotY = face.headEulerAngleY ?? 0;
    final rotX = face.headEulerAngleX ?? 0;
    final isFacingForward = rotY.abs() < 10 && rotX.abs() < 10;
    final eyesOpen =
        (face.leftEyeOpenProbability ?? 0) > 0.1 &&
        (face.rightEyeOpenProbability ?? 0) > 0.1;
    if (!isFacingForward || !eyesOpen) {
      Future.delayed(const Duration(seconds: 10), () {
        emit(StudentIsCheating());
        emit(CameraClosed());
        closeCamera();
      });
    }
    return isFacingForward && eyesOpen;
  }

  Future<void> closeCamera() async {
    _isCameraClosed = true; // ✅ block future processing

    try {
      if (cameraController != null) {
        if (cameraController!.value.isStreamingImages) {
          await cameraController!.stopImageStream(); // ✅ MUST
        }

        await cameraController!.dispose();
      }
    } catch (_) {}

    cameraController = null;

    emit(CameraClosed());
  }

  void requestLogout() {
    emit(RequestedLogOut());
  }

  void logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(Constants.kToken);
    emit(LogOutSuccess());
  }
}
