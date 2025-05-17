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
      final likelihood = entry.value['likelihood'];
      if (x != null && y != null && likelihood != null && likelihood > 0.7) {
        canvas.drawCircle(Offset(x, y), 2.0, pointPaint);
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
      // Helper to check likelihood
      bool hasHighLikelihood(Map<String, double>? point) {
        if (point == null) return false;
        final likelihood = point['likelihood'];
        return likelihood != null && likelihood > 0.7;
      }

      // Eyes
      // if (hasHighLikelihood(landmarkSet['rightEye']) && hasHighLikelihood(landmarkSet['leftEye'])) {
      //   drawLineBetween('rightEye', 'leftEye');
      // }
      // // Shoulders
      // if (hasHighLikelihood(landmarkSet['rightShoulder']) && hasHighLikelihood(landmarkSet['leftShoulder'])) {
      //   drawLineBetween('rightShoulder', 'leftShoulder');
      // }
      // Arms
      if (hasHighLikelihood(landmarkSet['rightShoulder']) && hasHighLikelihood(landmarkSet['rightElbow'])) {
        drawLineBetween('rightShoulder', 'rightElbow');
      }
      if (hasHighLikelihood(landmarkSet['rightElbow']) && hasHighLikelihood(landmarkSet['rightWrist'])) {
        drawLineBetween('rightElbow', 'rightWrist');
      }
      // if (hasHighLikelihood(landmarkSet['leftShoulder']) && hasHighLikelihood(landmarkSet['leftElbow'])) {
      //   drawLineBetween('leftShoulder', 'leftElbow');
      // }
      // if (hasHighLikelihood(landmarkSet['leftElbow']) && hasHighLikelihood(landmarkSet['leftWrist'])) {
      //   drawLineBetween('leftElbow', 'leftWrist');
      // }
      // Torso
      // if (hasHighLikelihood(landmarkSet['leftShoulder']) && hasHighLikelihood(landmarkSet['leftHip'])) {
      //   drawLineBetween('leftShoulder', 'leftHip');
      // }
      // if (hasHighLikelihood(landmarkSet['rightShoulder']) && hasHighLikelihood(landmarkSet['rightHip'])) {
      //   drawLineBetween('rightShoulder', 'rightHip');
      // }
      // if (hasHighLikelihood(landmarkSet['leftHip']) && hasHighLikelihood(landmarkSet['rightHip'])) {
      //   drawLineBetween('leftHip', 'rightHip');
      // }
      // Legs
      // if (hasHighLikelihood(landmarkSet['rightHip']) && hasHighLikelihood(landmarkSet['rightKnee'])) {
      //   drawLineBetween('rightHip', 'rightKnee');
      // }
      // if (hasHighLikelihood(landmarkSet['rightKnee']) && hasHighLikelihood(landmarkSet['rightAnkle'])) {
      //   drawLineBetween('rightKnee', 'rightAnkle');
      // }
      // if (hasHighLikelihood(landmarkSet['leftHip']) && hasHighLikelihood(landmarkSet['leftKnee'])) {
      //   drawLineBetween('leftHip', 'leftKnee');
      // }
      // if (hasHighLikelihood(landmarkSet['leftKnee']) && hasHighLikelihood(landmarkSet['leftAnkle'])) {
      //   drawLineBetween('leftKnee', 'leftAnkle');
      // }
      // Face (optional, if available)
      // if (hasHighLikelihood(landmarkSet['nose']) && hasHighLikelihood(landmarkSet['leftEye'])) {
      //   drawLineBetween('nose', 'leftEye');
      // }
      // if (hasHighLikelihood(landmarkSet['nose']) && hasHighLikelihood(landmarkSet['rightEye'])) {
      //   drawLineBetween('nose', 'rightEye');
      // }
      // if (hasHighLikelihood(landmarkSet['leftEye']) && hasHighLikelihood(landmarkSet['leftEar'])) {
      //   drawLineBetween('leftEye', 'leftEar');
      // }
      // if (hasHighLikelihood(landmarkSet['rightEye']) && hasHighLikelihood(landmarkSet['rightEar'])) {
      //   drawLineBetween('rightEye', 'rightEar');
      }
      // Hands (optional, if available)
    //   if (hasHighLikelihood(landmarkSet['rightWrist']) && hasHighLikelihood(landmarkSet['rightThumb'])) {
    //     drawLineBetween('rightWrist', 'rightThumb');
    //   }
    //   if (hasHighLikelihood(landmarkSet['rightWrist']) && hasHighLikelihood(landmarkSet['rightIndex'])) {
    //     drawLineBetween('rightWrist', 'rightIndex');
    //   }
    //   if (hasHighLikelihood(landmarkSet['rightWrist']) && hasHighLikelihood(landmarkSet['rightPinky'])) {
    //     drawLineBetween('rightWrist', 'rightPinky');
    //   }
    //   if (hasHighLikelihood(landmarkSet['leftWrist']) && hasHighLikelihood(landmarkSet['leftThumb'])) {
    //     drawLineBetween('leftWrist', 'leftThumb');
    //   }
    //   if (hasHighLikelihood(landmarkSet['leftWrist']) && hasHighLikelihood(landmarkSet['leftIndex'])) {
    //     drawLineBetween('leftWrist', 'leftIndex');
    //   }
    //   if (hasHighLikelihood(landmarkSet['leftWrist']) && hasHighLikelihood(landmarkSet['leftPinky'])) {
    //     drawLineBetween('leftWrist', 'leftPinky');
    //   }
    //   // Feet (optional, if available)
    //   if (hasHighLikelihood(landmarkSet['rightAnkle']) && hasHighLikelihood(landmarkSet['rightHeel'])) {
    //     drawLineBetween('rightAnkle', 'rightHeel');
    //   }
    //   if (hasHighLikelihood(landmarkSet['rightAnkle']) && hasHighLikelihood(landmarkSet['rightFootIndex'])) {
    //     drawLineBetween('rightAnkle', 'rightFootIndex');
    //   }
    //   if (hasHighLikelihood(landmarkSet['leftAnkle']) && hasHighLikelihood(landmarkSet['leftHeel'])) {
    //     drawLineBetween('leftAnkle', 'leftHeel');
    //   }
    //   if (hasHighLikelihood(landmarkSet['leftAnkle']) && hasHighLikelihood(landmarkSet['leftFootIndex'])) {
    //     drawLineBetween('leftAnkle', 'leftFootIndex');
    //   }
    // }
  }

  @override
  bool shouldRepaint(covariant CustomCanva oldDelegate) {
    // either always true, or only when the data differs:
    return oldDelegate.landmarks != landmarks;
  }
}