import 'package:flutter/material.dart';


class Coaching{

  static  List<List<Map<String, Map<String, double>>>>? landmarks ;
  static String? area;
  static String? muscle;
  static String? exercise;


  void evaluate(String area, String muscle, String exercise,List<List<Map<String, Map<String, double>>>> landmarks) {
    print('started evaluating...');
    





    if(area=='shoulder'){
      evaluateShoulderExercise(muscle, exercise);
    }
  }

  void evaluateShoulderExercise(String muscle, String exercise) {
    // Implement your logic to evaluate shoulder exercises
    if (muscle == 'front deltoid' && exercise == 'shoulderPress') {
      shoulderPress();
    }
  }

  void shoulderPress() {
    // // Implement your logic to evaluate shoulder press
    // // For example, check the angles of the shoulders and elbows
    // if (landmarks.isNotEmpty) {
    //   final shoulderLeft = landmarks[0]['leftShoulder'];
    //   final shoulderRight = landmarks[0]['rightShoulder'];
    //   final elbowLeft = landmarks[0]['leftElbow'];
    //   final elbowRight = landmarks[0]['rightElbow'];

    //   if (shoulderLeft != null && shoulderRight != null && elbowLeft != null && elbowRight != null) {
    //     // Calculate angles and provide feedback
    //     print('Evaluating shoulder press...');
    //   }
    //   
    // }
    print ('finished evaluating shoulder press');
  }
}

