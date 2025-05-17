import 'dart:io';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/core/coaching/arms/biceps_curl_exercices_evaluator.dart';
import 'package:mobile/core/provider/pose_detector_provider.dart';
import 'package:provider/provider.dart';

import '../ml_pose_detector/ml_pose_detector.dart';
import '../coaching/coaching.dart';

class CameraLogic {

MlPoseDetectorFunctions mlPoseDetectorFunctions = MlPoseDetectorFunctions();


late final camera ;


Future<void> initializeCamera(PoseDetectorProvider poseDetectorProvider) async {
    
    List<CameraDescription>? cameras = await availableCameras();
    
    
    int selectedCameraIdx = 1;
    poseDetectorProvider.setCamera( cameras[selectedCameraIdx]);
  
    poseDetectorProvider.setController ( CameraController(
      poseDetectorProvider.camera!,
      fps: 30,
      ResolutionPreset.low,
      
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21 // for Android
          : ImageFormatGroup.bgra8888,
    ));

   
    await poseDetectorProvider.controller!.initialize();
    
    
  }


  void streamFrames(BuildContext context ) {
    PoseDetectorProvider workoutProvider = context.read<PoseDetectorProvider>();

    DateTime lastProcessed = DateTime.now().subtract(const Duration(milliseconds: 150));

    List<List<Map<String, Map<String, double>>>> landmarks = [];

    workoutProvider.controller!.startImageStream((CameraImage image) async{
      final now = DateTime.now();
      if (now.difference(lastProcessed).inMilliseconds >= 150) {
        lastProcessed = now;
        List<Map<String, Map<String, double>>> newLandmark =await mlPoseDetectorFunctions.processCameraImage(image, context);
        
        landmarks.add(newLandmark);
        Coaching().evaluate( context,landmarks);
      }
    });

   
  }

   void disposeCameraController(PoseDetectorProvider workoutProvider) {

    workoutProvider.controller!.stopImageStream();
    workoutProvider.controller!.dispose();
    
  }

}