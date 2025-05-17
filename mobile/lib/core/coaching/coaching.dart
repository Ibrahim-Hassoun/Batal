import 'package:flutter/material.dart';
import 'package:mobile/core/coaching/arms/biceps_curl_exercices_evaluator.dart';
import 'package:mobile/core/coaching/interface_exercice_evaluator.dart';
import 'package:mobile/core/provider/pose_detector_provider.dart';
import 'package:provider/provider.dart';

class Coaching{


  static PoseDetectorProvider? provider;

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
   
    provider = context.read<PoseDetectorProvider>();
    String? area = provider!.detected_area;
    
    String? exercice = provider!.detected_exercise;
  
    final areaEvaluators = evaluators[area];
  

    final evaluator = areaEvaluators?[exercice];
   
    evaluator?.evaluate(context,landmarks);
  }

}

