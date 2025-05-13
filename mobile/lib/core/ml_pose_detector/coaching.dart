import 'package:flutter/material.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import 'package:mobile/lib/angles/geometry.dart';

class Coaching{

  static  List<List<Map<String, Map<String, double>>>>? landmarks ;
  static String? area;
  static String? muscle;
  static String? exercise;

  static double? minAngle;
  static double? maxAngle;

  static WorkoutProvider? provider;

  void evaluate() {
    // print('started evaluating');
    // print('area: $area');
    // print('muscle: $muscle');
    // print('exercise: $exercise');
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
    
    if (muscle == 'biceps' && exercise == 'curl') {
      if (landmarks != null && landmarks!.isNotEmpty) {
        var lastFrame = landmarks!.last;
        for (var landmark in lastFrame) {
          final rightWrist = landmark['rightWrist'];
          final rightElbow = landmark['rightElbow'];
          final rightShoulder = landmark['rightShoulder'];
          // print('rightWrist: $rightWrist');
          // print('rightElbow: $rightElbow');
          // print('rightShoulder: $rightShoulder');
            if (rightShoulder != null && rightElbow != null && rightWrist != null &&
              rightShoulder['likelihood']! > 0.7 &&
              rightElbow['likelihood']! > 0.7 &&
              rightWrist['likelihood']! > 0.7) {
            double angle = Geometry.calculateAngle(
              rightShoulder['x']!, rightShoulder['y']!,
              rightElbow['x']!, rightElbow['y']!,
              rightWrist['x']!, rightWrist['y']!
              
            );
            print('Elbow angle: $angle');
            provider?.setMLFeedback('new feedbackkkk');


          }
        }
      }
    }
  }









  void shoulderPress() {
    
    print ('finished evaluating shoulder press');
  }
}

