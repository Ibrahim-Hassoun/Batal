import 'dart:io';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:mobile/core/provider/workout_provider.dart';

import '../ml_pose_detector/ml_pose_detector.dart';
import '../ml_pose_detector/coaching.dart';

class CameraLogic {

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
    workoutProvider.setCamera( cameras[selectedCameraIdx]);
  
    workoutProvider.setController ( CameraController(
      workoutProvider.camera!,
      fps: 30,
      ResolutionPreset.low,
      videoBitrate: 1,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21 // for Android
          : ImageFormatGroup.bgra8888,
    ));

   
    await workoutProvider.controller!.initialize();
    
    
  }


  void startStreaming(WorkoutProvider workoutProvider) {
    //prepare the coaching class variables
    Coaching.area = workoutProvider.detected_area;
    Coaching.muscle = workoutProvider.detected_muscle;
    Coaching.exercise = workoutProvider.detected_exercise;
    Coaching.provider = workoutProvider;
    Coaching.maxAngle=0;
    Coaching.minAngle=200;
    // these setters are used for testing purposes


    DateTime lastProcessed = DateTime.now().subtract(const Duration(milliseconds: 200));

    List<List<Map<String, Map<String, double>>>> landmarks = [];

    workoutProvider.controller!.startImageStream((CameraImage image) async{
      final now = DateTime.now();
      if (now.difference(lastProcessed).inMilliseconds >= 200) {
        lastProcessed = now;
        List<Map<String, Map<String, double>>> newLandmark =await mlPoseDetectorFunctions.processCameraImage(image, workoutProvider.poseDetector!,workoutProvider);
        // print(newLandmark);
        landmarks.add(newLandmark);
        print('from streaming');
        Coaching.landmarks = landmarks;
        Coaching().evaluate( );
      }
    });

   
  }

   void disposeCameraController(WorkoutProvider workoutProvider) {

    workoutProvider.controller!.stopImageStream();
    workoutProvider.controller!.dispose();
    
  }

}