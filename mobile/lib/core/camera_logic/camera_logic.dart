import 'dart:io';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import '../tensorflow/tensorflow.dart';
import '../ml_pose_detector/ml_pose_detector.dart';
import '../ml_pose_detector/coaching.dart';

class CameraLogic {
TensorflowFunctions tensorflowFunctions = TensorflowFunctions();
MlPoseDetectorFunctions mlPoseDetectorFunctions = MlPoseDetectorFunctions();


late final camera ;
final _orientations = {
  DeviceOrientation.portraitUp: 0,
  DeviceOrientation.landscapeLeft: 90,
  DeviceOrientation.portraitDown: 180,
  DeviceOrientation.landscapeRight: 270,
};

Future<void> initializeCamera(WorkoutProvider workoutProvider) async {
    
    List<CameraDescription>? cameras = await availableCameras();
    
    
    int selectedCameraIdx = 1;
   
    
    workoutProvider.setController ( CameraController(
      cameras[selectedCameraIdx],
      ResolutionPreset.low,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21 // for Android
          : ImageFormatGroup.bgra8888,
    ));

   
    await workoutProvider.controller!.initialize();
    
    
  }


  void startStreaming(WorkoutProvider workoutProvider) {
    DateTime lastProcessed = DateTime.now().subtract(const Duration(milliseconds: 150));

    List<List<Map<String, Map<String, double>>>> landmarks = [];

    workoutProvider.controller!.startImageStream((CameraImage image) async{
      final now = DateTime.now();
      if (now.difference(lastProcessed).inMilliseconds >= 150) {
        lastProcessed = now;
        List<Map<String, Map<String, double>>> newLandmark =await mlPoseDetectorFunctions.processCameraImage(image, workoutProvider.poseDetector!,workoutProvider);
        landmarks.add(newLandmark);
        print('from streaming');
         Coaching().evaluate("shoulder", "front deltoid", "shoulderPress", landmarks);
      }
    });

   
  }

   void disposeCameraController(WorkoutProvider workoutProvider) {

    workoutProvider.controller!.stopImageStream();
    workoutProvider.controller!.dispose();
    
  }

}