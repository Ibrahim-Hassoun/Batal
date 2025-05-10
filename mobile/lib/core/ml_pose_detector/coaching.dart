import 'package:flutter/material.dart';


class Coaching{

  void evaluate(String area, String muscle, String exercise,List<Map<String, Map<String, double>>> landmarks) {
    
    if(area=='shoulder'){
      evaluateShoulderExercise(muscle, exercise, landmarks);
    }
  }
  

}

