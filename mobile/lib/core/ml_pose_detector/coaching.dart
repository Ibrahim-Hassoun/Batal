import 'package:flutter/material.dart';


class Coaching{

  static  List<List<Map<String, Map<String, double>>>>? landmarks ;
  static String? area;
  static String? muscle;
  static String? exercise;


  void evaluate() {
    print('started evaluating');
    print('area: $area');
    print('muscle: $muscle');
    print('exercise: $exercise');
    if(area=='shoulder'){
      evaluateShoulderExercise();
    }else if(area=='arm'){
      evaluateArmExercise();
    }
  }

  void evaluateShoulderExercise() {
    // Implement your logic to evaluate shoulder exercises
    if (muscle == 'front deltoid' && exercise == 'shoulder press') {
      shoulderPress();
    }
  }
  void evaluateArmExercise() {
    // Implement your logic to evaluate arm exercises
    if (muscle == 'biceps' && exercise == 'curl') {
      if (landmarks != null && landmarks!.isNotEmpty) {
        for (var frame in landmarks!) {
          for (var landmark in frame) {
            final rightWrist = landmark['rightWrist'];
            final rightElbow = landmark['rightElbow'];
            final rightShoulder = landmark['rightShoulder'];
            print('rightWrist: $rightWrist');
            print('rightElbow: $rightElbow');
            print('rightShoulder: $rightShoulder');
          }
        }
      }
    }
  }









  void shoulderPress() {
    
    print ('finished evaluating shoulder press');
  }
}

