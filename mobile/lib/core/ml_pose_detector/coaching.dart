import 'package:flutter/material.dart';
import 'package:mobile/core/coaching/arms/biceps_curl_exercices_evaluator.dart';
import 'package:mobile/core/coaching/exercice_evaluator.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import 'package:mobile/lib/angles/geometry.dart';
import 'package:provider/provider.dart';

class Coaching{

  static  List<List<Map<String, Map<String, double>>>>? landmarks ;
  static WorkoutProvider? provider;

  final Map<String, Map<String, ExerciceEvaluator>> evaluators = {
  'shoulder': {
    // 'press': PressEvaluator(),
    // 'lateral_raise': LateralRaiseEvaluator(),
  },
  'arm' : {
    'curl' :BicepsCurlExercicesEvaluator()
  },
  'legs': {
    // 'squat': SquatEvaluator(),
  },
  // add more areas...
};

  void evaluate(BuildContext context) {
    provider = context.read<WorkoutProvider>();
    String? area = provider!.detected_area;
   
    

    
    if(area=='shoulder'){
      evaluateShoulderExercise( context);
    }else if(area=='arm'){
      evaluateArmExercise();
    }
  }

  void evaluateShoulderExercise(BuildContext context) {
    //  
    // String? exercise = provider!.detected_exercise;
    // if (muscle == 'front deltoid' && exercise == 'shoulder press') {
    //   shoulderPress();
    // }
  }
  
  void evaluateArmExercise() {
    String? muscle = provider!.detected_muscle;

    if (muscle == 'biceps')
      {
        evaluateBicepsExercice();
      }
    
  }

  void evaluateBicepsExercice(){
    String? exercise = provider!.detected_exercise;
     if(exercise =='curl') {
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

                  
            const feedbackMsg = 'you tuck your arm too much!';
            if (angle < 70) {
              if (!(provider?.MLFeedback?.contains(feedbackMsg) ?? false)) {
              provider?.setMLFeedback(feedbackMsg);
              }
            }
            if (angle > 160) {
              const feedbackMsg = 'you open your arm too much!';
              if (!(provider?.MLFeedback?.contains(feedbackMsg) ?? false)) {
              provider?.setMLFeedback(feedbackMsg);
              }
            }
            


          }
        }
      }
    }
  }







  void shoulderPress() {
    
    print ('finished evaluating shoulder press');
  }
}

