import 'package:flutter/material.dart';
import 'package:mobile/core/coaching/arms/biceps_curl_exercices_evaluator.dart';
import 'package:mobile/core/coaching/exercice_evaluator.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import 'package:mobile/lib/angles/geometry.dart';
import 'package:provider/provider.dart';

class Coaching{


  static WorkoutProvider? provider;

  final Map<String, Map<String, ExerciceEvaluator>> evaluators = {
  'shoulder': {
  },
  'arm' : {
    'curl' :BicepsCurlExercicesEvaluator()
  },
  'legs': {
    
  },
};

  void evaluate(BuildContext context){
    provider = context.read<WorkoutProvider>();
    String? area = provider!.detected_area;
    String? muscle = provider!.detected_muscle;
    String? exercice = provider!.detected_exercise;

      final areaEvaluators = evaluators[area];
      final evaluator = areaEvaluators?[exercice];
      evaluator?.evaluate();
  }

}

