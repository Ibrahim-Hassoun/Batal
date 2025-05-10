import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import '../tensorflow/tensorflow.dart';

class CameraLogic {
TensorflowFunctions tensorflowFunctions = TensorflowFunctions();

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
    this.camera = cameras[selectedCameraIdx];
    
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
        // Process the image here
        
        tensorflowFunctions.process(image, workoutProvider);
        print('from streaming');
      }
    });
  }

   void disposeCameraController(WorkoutProvider workoutProvider) {

    workoutProvider.controller!.stopImageStream();
    workoutProvider.controller!.dispose();
    
  }
InputImage? _inputImageFromCameraImage(CameraImage image) {
  final camera =  this.camera;
  
   final format = InputImageFormatValue.fromRawValue(image.format.raw);

   if (format == null ||
          (Platform.isAndroid && format != InputImageFormat.nv21) ||
          (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

      if (image.planes.length != 1) return null;
  final plane = image.planes.first;

    return InputImage.fromBytes(
    bytes: plane.bytes,
     metadata: InputImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: InputImageRotation.rotation0deg, // used only in Android
      format: format, // used only in iOS
      bytesPerRow: plane.bytesPerRow, // used only in iOS
    ),
    );
} 
}