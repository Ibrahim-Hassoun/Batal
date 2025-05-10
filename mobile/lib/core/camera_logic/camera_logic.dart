import 'dart:io';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import '../tensorflow/tensorflow.dart';
import '../ml_pose_detector/ml_pose_detector.dart';

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
    DateTime lastProcessed = DateTime.now().subtract(const Duration(milliseconds: 1000));
    workoutProvider.controller!.startImageStream((CameraImage image) {
      final now = DateTime.now();
      if (now.difference(lastProcessed).inMilliseconds >= 1000) {
        lastProcessed = now;
        mlPoseDetectorFunctions.processCameraImage(image, workoutProvider.poseDetector!,workoutProvider);

        
        // tensorflowFunctions.process(image, workoutProvider);
        print('from streaming');
      }
    });
  }

   void disposeCameraController(WorkoutProvider workoutProvider) {

    workoutProvider.controller!.stopImageStream();
    workoutProvider.controller!.dispose();
    
  }

}