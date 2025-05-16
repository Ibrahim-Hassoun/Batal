import 'package:flutter/material.dart';
import 'package:mobile/core/coaching/interface_exercice_evaluator.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import 'package:mobile/lib/angles/geometry.dart';
import 'package:provider/provider.dart';

class BicepsCurlExercicesEvaluator implements ExerciceEvaluator{

  static WorkoutProvider? provider;

  @override
  void evaluate( BuildContext context,List<List<Map<String, Map<String, double>>>> landmarks){
        provider = context.read<WorkoutProvider>();
        print(provider!.MLFeedback);
        if ( landmarks.isNotEmpty) {
        var lastFrame = landmarks.last;
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

                  
            const feedbackMsg = 'you tuck your arm too much!';
            if (angle < 70) {
              if (!(provider?.MLFeedback.contains(feedbackMsg) ?? false)) {
              provider?.setMLFeedback(feedbackMsg);
              }
            }
            if (angle > 160) {
              const feedbackMsg = 'you open your arm too much!';
              if (!(provider?.MLFeedback.contains(feedbackMsg) ?? false)) {
              provider?.setMLFeedback(feedbackMsg);
              }
            }
            


          }
        }
      }
  }
}