import 'package:mobile/core/provider/workout_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:async';
import 'package:camera/camera.dart';


class TensorflowFunctions {

Future<void> loadModel(WorkoutProvider workoutProvider) async {
  try {
    // Load the model
    Interpreter interpreter = await Interpreter.fromAsset('assets/movenet.tflite');
    workoutProvider.setInterpreter(interpreter)  ;
    workoutProvider.setModelLoaded(true);

    print("Model loaded successfully");
  } catch (e) {
    print("Error loading model: $e");
  }
}

void test(){
  print("this is a test function");
}


void process(CameraImage image){
  print("this is a process function for");
  print(image);
 
}
}