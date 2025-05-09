import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/provider/workout_provider.dart';


class CameraLogic {

Future<void> initializeCamera(WorkoutProvider workoutProvider) async {
    
    List<CameraDescription>? cameras = await availableCameras();
    
    
    int selectedCameraIdx = 1;

    
    workoutProvider.setController ( CameraController(
      cameras![selectedCameraIdx!],
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    ));

   
    await workoutProvider.controller!.initialize();
    
    
  }


  void startStreaming(WorkoutProvider workoutProvider) async {
    await workoutProvider.controller!.startImageStream((CameraImage image) {
      // Process the image here
      print('Received image with ${image.planes.length} planes');
      
    });
  }
}