// ignore_for_file: prefer_conditional_assignment

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:mobile/core/provider/pose_detector_provider.dart';
import 'package:provider/provider.dart';

class MlPoseDetectorFunctions {

  CameraDescription? camera;
  late PoseDetector poseDetector;
  late PoseDetectorProvider poseDetectorProvider;


  final _orientations = {
  DeviceOrientation.portraitUp: 0,
  DeviceOrientation.landscapeLeft: 90,
  DeviceOrientation.portraitDown: 180,
  DeviceOrientation.landscapeRight: 270,
  };

  Future<List<Map<String, Map<String, double>>>> processCameraImage(CameraImage image, BuildContext context) async{
    
    // if(poseDetectorProvider == null ){
      poseDetectorProvider = context.read<PoseDetectorProvider>();
    //}
    // if(poseDetector == null ){
      poseDetector = poseDetectorProvider.poseDetector!;
    // }
    // if(camera == null ){
      camera = poseDetectorProvider.camera;
    // }
   
   

    InputImage? inputImage = _inputImageFromCameraImage(image);
    List<Map<String, Map<String, double>>> landmarks = await detectPose(poseDetector, inputImage!);
    
    poseDetectorProvider.setLandmarks(landmarks);
    return landmarks;
    
}

  
  InputImage? _inputImageFromCameraImage(CameraImage image) {
  print('we are now inside inputImageFromCamera method');
  final camera =  this.camera!;
  final sensorOrientation = camera.sensorOrientation;
  print('sensorOrientaion is: ');
  print(sensorOrientation);
  InputImageRotation? rotation;

   if (Platform.isIOS) {
    rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
  } else if (Platform.isAndroid) {
     //for testing on laptop
     
    final fakeDeviceOrientation = DeviceOrientation.landscapeLeft;
    var rotationCompensation=_orientations[fakeDeviceOrientation];

    //on real application

    // var rotationCompensation =
    //     _orientations[poseDetectorProvider.controller!.value.deviceOrientation];
       
    if (rotationCompensation == null) return null;
    if (camera.lensDirection == CameraLensDirection.front) {
      // front-facing
      print('rotation compensation before: ');
      print(rotationCompensation);
      rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      print('rotation compensation after: ');
      print(rotationCompensation);
    } else {
      // back-facing
      rotationCompensation =
          (sensorOrientation - rotationCompensation + 360) % 360;
    }
    rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
  }
  if (rotation == null) return null;

  final format = InputImageFormatValue.fromRawValue(image.format.raw);

   if (format == null ||
          (Platform.isAndroid && format != InputImageFormat.nv21) ||
          (Platform.isIOS && format != InputImageFormat.bgra8888)) {
     return null;
   }

      if (image.planes.length != 1) return null;
  final plane = image.planes.first;

    return InputImage.fromBytes(
    bytes: plane.bytes,
     metadata: InputImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: InputImageRotation.rotation180deg, // used only in Android
      format: format, // used only in iOS
      bytesPerRow: plane.bytesPerRow, // used only in iOS
    ),
    );
} 


  Future<List<Map<String, Map<String, double>>>> detectPose(PoseDetector poseDetector, InputImage inputImage) async {
    final List<Pose> poses = await poseDetector.processImage(inputImage);
    // Create a list to hold all poses' landmarks data
    List<Map<String, Map<String, double>>> allPosesLandmarks = [];

    for (Pose pose in poses) {
      // Map to hold this pose's landmarks
      Map<String, Map<String, double>> landmarksMap = {};

      pose.landmarks.forEach((type, landmark) {
      
        landmarksMap[type.name] = {
          'x': landmark.x,
          'y': landmark.y,
          'z': landmark.z,
          'likelihood': landmark.likelihood,
        };
        
      });
      
      allPosesLandmarks.add(landmarksMap);
      
    }

    // Now allPosesLandmarks contains all landmarks with their x, y, and likelihood for each pose
    // print(allPosesLandmarks);
    return allPosesLandmarks;
  }

}