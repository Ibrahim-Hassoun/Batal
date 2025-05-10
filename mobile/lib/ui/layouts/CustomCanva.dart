import 'package:flutter/material.dart';

class CustomCanva extends CustomPainter {

  final List<Map<String, Map<String, double>>> landmarks;

  CustomCanva(this.landmarks);

  @override
  void paint(Canvas canvas, Size size) {
    final pointPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1.0;

    for (final landmarkSet in landmarks) {
      // Draw all points
      for (final entry in landmarkSet.entries) {
      final x = entry.value['x'];
      final y = entry.value['y'];
      if (x != null && y != null) {
        canvas.drawCircle(Offset(y, x), 2.0, pointPaint);
      }
      }

      // Helper to draw a line between two points if both exist
      void drawLineBetween(String a, String b) {
      final pa = landmarkSet[a];
      final pb = landmarkSet[b];
      if (pa != null && pb != null) {
        final ax = pa['x'], ay = pa['y'];
        final bx = pb['x'], by = pb['y'];
        if (ax != null && ay != null && bx != null && by != null) {
        canvas.drawLine(Offset(ay, ax), Offset(by, bx), linePaint);
        }
      }
      }

      // Eyes
      drawLineBetween('rightEye', 'leftEye');
      // Shoulders
      drawLineBetween('rightShoulder', 'leftShoulder');
      // Arms
      drawLineBetween('rightShoulder', 'rightElbow');
      drawLineBetween('rightElbow', 'rightWrist');
      drawLineBetween('leftShoulder', 'leftElbow');
      drawLineBetween('leftElbow', 'leftWrist');
      // Torso
      drawLineBetween('leftShoulder', 'leftHip');
      drawLineBetween('rightShoulder', 'rightHip');
      drawLineBetween('leftHip', 'rightHip');
      // Legs
      drawLineBetween('rightHip', 'rightKnee');
      drawLineBetween('rightKnee', 'rightAnkle');
      drawLineBetween('leftHip', 'leftKnee');
      drawLineBetween('leftKnee', 'leftAnkle');
      // Face (optional, if available)
      drawLineBetween('nose', 'leftEye');
      drawLineBetween('nose', 'rightEye');
      drawLineBetween('leftEye', 'leftEar');
      drawLineBetween('rightEye', 'rightEar');
      // Hands (optional, if available)
      drawLineBetween('rightWrist', 'rightThumb');
      drawLineBetween('rightWrist', 'rightIndex');
      drawLineBetween('rightWrist', 'rightPinky');
      drawLineBetween('leftWrist', 'leftThumb');
      drawLineBetween('leftWrist', 'leftIndex');
      drawLineBetween('leftWrist', 'leftPinky');
      // Feet (optional, if available)
      drawLineBetween('rightAnkle', 'rightHeel');
      drawLineBetween('rightAnkle', 'rightFootIndex');
      drawLineBetween('leftAnkle', 'leftHeel');
      drawLineBetween('leftAnkle', 'leftFootIndex');
    }
  }

  @override
  bool shouldRepaint(covariant CustomCanva oldDelegate) {
    // either always true, or only when the data differs:
    return oldDelegate.landmarks != landmarks;
  }
}