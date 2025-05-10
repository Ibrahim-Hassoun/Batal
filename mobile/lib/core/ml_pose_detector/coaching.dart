import 'package:flutter/material.dart';


class Coaching{

  static  List<List<Map<String, Map<String, double>>>>? landmarks ;

  void evaluate(String area, String muscle, String exercise,List<Map<String, Map<String, double>>> landmarks) {
    
    if(area=='shoulder'){
      evaluateShoulderExercise(muscle, exercise, landmarks);
    }
  }

  void evaluateShoulderExercise(String muscle, String exercise, List<Map<String, Map<String, double>>> landmarks) {
    // Implement your logic to evaluate shoulder exercises
    if (muscle == 'front deltoid' && exercise == 'shoulderPress') {
      shoulderPress(landmarks);
    }
  }

  void shoulderPress(List<Map<String, Map<String, double>>> landmarks) {
    // Implement your logic to evaluate shoulder press
    // For example, check the angles of the shoulders and elbows
    if (landmarks.isNotEmpty) {
      final shoulderLeft = landmarks[0]['leftShoulder'];
      final shoulderRight = landmarks[0]['rightShoulder'];
      final elbowLeft = landmarks[0]['leftElbow'];
      final elbowRight = landmarks[0]['rightElbow'];

      if (shoulderLeft != null && shoulderRight != null && elbowLeft != null && elbowRight != null) {
        // Calculate angles and provide feedback
        print('Evaluating shoulder press...');
      }
    }
  }
}

