import 'package:flutter/material.dart';
import 'package:mobile/core/coaching/arms/biceps_curl_exercices_evaluator.dart';
import 'package:mobile/core/coaching/interface_exercice_evaluator.dart';
import 'package:mobile/core/provider/workout_provider.dart';
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

  void evaluate(BuildContext context, List<List<Map<String, Map<String, double>>>> landmarks){
    print('we passed the empty checkkkkkkkkkkkkkfddsafadslids;ewqfwqinas;lkna;foihpilknsd;lkbdsa;oif');
    provider = context.read<WorkoutProvider>();
    String? area = provider!.detected_area;
    print("the area in main coach is "+area);
    String? exercice = provider!.detected_exercise;
  print("the exercice in main coach is "+exercice);
    final areaEvaluators = evaluators[area];
    print('the areaEvaluator is');
    print(areaEvaluators);

    final evaluator = areaEvaluators?[exercice];
    print('the evaluator is');
    print(evaluator);
    evaluator?.evaluate(context,landmarks);
  }

}

