import 'dart:async';
import 'package:camera/camera.dart';
import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/features/user/domain/repos/user_repo.dart';
import 'package:coursaty/features/user/prsentation/manager/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo userRepo;
  UserCubit(this.userRepo) : super(CameraInitial());
  CameraController? cameraController;
  late FaceDetector faceDetector;
  bool _isProcessing = false;
  bool _isCameraClosed = false;
  Timer? _cheatingTimer;

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
    _isCameraClosed = false;

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

      final faces = await faceDetector.processImage(inputImage);

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
      if (_cheatingTimer == null || !_cheatingTimer!.isActive) {
        _cheatingTimer = Timer(const Duration(seconds: 6), () {
          if (!_isCameraClosed) {
            emit(StudentIsCheating());
            emit(CameraClosed());
            closeCamera();
          }
        });
      }
    } else {
      _cheatingTimer?.cancel();
    }
    return isFacingForward && eyesOpen;
  }

  Future<void> closeCamera() async {
    _isCameraClosed = true;
    _cheatingTimer?.cancel();

    try {
      if (cameraController != null) {
        if (cameraController!.value.isStreamingImages) {
          await cameraController!.stopImageStream();
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

  void markAsCheating({
    required String courseId,
    required String studentId,
  }) async {
    emit(MarkAsCheatingLoading());
    final token = await SharedPreferences.getInstance().then(
      (value) => value.getString(Constants.kToken),
    );
    try {
      await userRepo.markAsCheating(
        token: token!,
        courseId: courseId,
        studentId: studentId,
      );
      emit(MarkAsCheatingSuccess());
    } catch (e) {
      emit(MarkAsCheatingError(e.toString()));
    }
  }

  void getGrades() async {
    emit(GetGradesLoading());
    try {
      final token = await SharedPreferences.getInstance().then(
        (value) => value.getString(Constants.kToken),
      );
      final grades = await userRepo.getGrades(token: token!);
      emit(GetGradesSuccess(grades));
    } catch (e) {
      emit(GetGradesError(e.toString()));
    }
  }

  int getScore({
    required List<int?> selectedAnswers,
    required List<int> correctAnswers,
  }) {
    int score = 0;
    for (int i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == correctAnswers[i]) {
        score += 20;
      }
    }
    return score;
  }

  void setGrade({required String enrollmentId, required int grade}) async {
    emit(SetGradeLoading());
    try {
      final token = await SharedPreferences.getInstance().then(
        (value) => value.getString(Constants.kToken),
      );
      await userRepo.setGrade(
        token: token!,
        enrollmentId: enrollmentId,
        grade: grade,
      );
      emit(SetGradeSuccess());
    } catch (e) {
      emit(SetGradeError(e.toString()));
    }
  }

  bool handleAppExit(AppLifecycleState state) {
    final didExit =
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached;

    if (didExit || !_isCameraClosed) {
      emit(StudentIsCheating());
      emit(CameraClosed());

      closeCamera();

      return true;
    }

    return false;
  }
}
