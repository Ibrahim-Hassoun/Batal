import 'package:flutter/material.dart';

class CustomCanva extends CustomPainter {

  final List<Map<String, Map<String, double>>> landmarks;

  CustomCanva(this.landmarks);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    for (final landmarkSet in landmarks) {
      for (final entry in landmarkSet.entries) {
        final x = entry.value['x'];
        final y = entry.value['y'];
        if (x != null && y != null) {
          canvas.drawCircle(Offset(x, y), 3.0, paint);
        }
      }
    }
  }

   @override
  bool shouldRepaint(covariant CustomCanva oldDelegate) {
    // either always true, or only when the data differs:
    return oldDelegate.landmarks != landmarks;
  }
}