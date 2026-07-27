import 'package:acoursa/Core/Themes/color_data.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FacePainter extends CustomPainter {
  final List<Face> faces;

  final Size imageSize;
  FacePainter({required this.faces, required this.imageSize});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorData.success500Color
      ..style = .stroke
      ..strokeWidth = 2;
    final double imageAspectRatio = imageSize.width / imageSize.height;
    final double canvasAspectRatio = size.width / size.height;

    double scaleX, scaleY;
    double dx = 0, dy = 0;

    if (canvasAspectRatio > imageAspectRatio) {
      scaleX = size.width / imageSize.width;
      scaleY = scaleX;
      dy = (size.height - imageSize.height * scaleY) / 2;
    } else {
      scaleY = size.height / imageSize.height;
      scaleX = scaleY;
      dx = (size.width - imageSize.width * scaleX) / 2;
    }

    for (final face in faces) {
      final double centerX =
          size.width - (face.boundingBox.center.dx * scaleX + dx);
      final double centerY = face.boundingBox.center.dy * scaleY + dy;

      final double width = face.boundingBox.width * scaleX;
      final double height = face.boundingBox.height * scaleY;

      final rect = Rect.fromCenter(
        center: Offset(centerX, centerY),
        width: width,
        height: height,
      );

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
