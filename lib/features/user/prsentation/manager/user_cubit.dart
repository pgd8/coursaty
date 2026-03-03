import 'dart:async';

import 'package:camera/camera.dart';
import 'package:coursaty/features/user/prsentation/manager/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(CameraInitial());

  CameraController? cameraController;
  late FaceDetector faceDetector;

  bool _isProcessing = false;

  void initializeFaceDetector() {
    faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: true,
        enableLandmarks: true, //nose eyes mouth
        enableTracking: true, //tracking face
        enableClassification: true,
        performanceMode: .accurate,
      ),
    );
  }

  Future<void> initializeCamera() async {
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
        imageFormatGroup: ImageFormatGroup.nv21, // or .yuv420
      );

      await cameraController!.initialize();

      await cameraController!.startImageStream(processCameraImage);

      emit(CameraOpened(cameraController!));
    } catch (e) {
      emit(CameraError(e.toString()));
    }
  }

  Future<void> processCameraImage(CameraImage image) async {
    if (_isProcessing) return;
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
      final faces = await faceDetector.processImage(inputImage);
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
      emit(CameraError(e.toString()));
    }

    _isProcessing = false;
  }

  bool isValidFace(Face face) {
    final rotY = face.headEulerAngleY ?? 0;
    final rotX = face.headEulerAngleX ?? 0;

    final isFacingForward = rotY.abs() < 10 && rotX.abs() < 10;

    final eyesOpen =
        (face.leftEyeOpenProbability ?? 0) > 0.1 &&
        (face.rightEyeOpenProbability ?? 0) > 0.1;

    return isFacingForward && eyesOpen;
  }

  Future<void> closeCamera() async {
    await cameraController?.dispose();
    faceDetector.close();
    emit(CameraClosed());
  }
}
