import 'package:flutter/material.dart';


class Coaching{

  static  List<List<Map<String, Map<String, double>>>>? landmarks ;
  static String? area;
  static String? muscle;
  static String? exercise;


  void evaluate() {
  
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
      print('evaluating bicep curl');
    }
  }









  void shoulderPress() {
    
    print ('finished evaluating shoulder press');
  }
}

