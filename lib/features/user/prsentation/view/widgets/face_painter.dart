import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FacePainter extends CustomPainter {
  final List<Face> faces;

  final Size imageSize;
  FacePainter({required this.faces, required this.imageSize});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorData.danger500Color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final scaleX = size.width / imageSize.width;
    final scaleY = size.height / imageSize.height;
    for (final face in faces) {
      final rect = Rect.fromLTRB(
        face.boundingBox.left * scaleX,
        face.boundingBox.top * scaleY,
        face.boundingBox.right * scaleX,
        face.boundingBox.bottom * scaleY,
      );
      final rRect = RRect.fromRectAndRadius(rect, Radius.circular(10.r));
      canvas.drawRRect(rRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
