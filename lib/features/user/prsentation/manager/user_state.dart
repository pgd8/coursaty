import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter/material.dart';

abstract class UserState {}

class CameraInitial extends UserState {}

class CameraLoading extends UserState {}

class CameraOpened extends UserState {
  final CameraController controller;
  CameraOpened(this.controller);
}

class DetectingFace extends UserState {}

class FaceDetected extends UserState {
  final List<Face> faces;
  final Size imageSize;

  FaceDetected({required this.faces, required this.imageSize});
}

class FaceNotDetected extends UserState {}

class CameraClosed extends UserState {}

class CameraError extends UserState {
  final String message;
  CameraError(this.message);
}

class RequestedLogOut extends UserState {}

class LogOutSuccess extends UserState {}

