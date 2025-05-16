import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:mobile/core/provider/workout_provider.dart';

class MlPoseDetectorFunctions {
  get camera => null;


  Future<List<Map<String, Map<String, double>>>> processCameraImage(CameraImage image, PoseDetector poseDetector,WorkoutProvider workoutProvider) async{
    InputImage? inputImage = _inputImageFromCameraImage(image);
    
   
    
    
    List<Map<String, Map<String, double>>> landmarks = await detectPose(poseDetector, inputImage!);
    
    workoutProvider.setLandmarks(landmarks);
    return landmarks;
    
}

  InputImage? _inputImageFromCameraImage(CameraImage image) {
  final camera =  this.camera;
  

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
      rotation: InputImageRotation.rotation0deg, // used only in Android
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
        if (type.name == 'rightWrist' || type.name == 'rightElbow' || type.name == 'rightShoulder'){
        landmarksMap[type.name] = {
          'x': landmark.x,
          'y': landmark.y,
          'z': landmark.z,
          'likelihood': landmark.likelihood,
        };
        }
      });
      
      allPosesLandmarks.add(landmarksMap);
      print(landmarksMap);
    }

    // Now allPosesLandmarks contains all landmarks with their x, y, and likelihood for each pose
    // print(allPosesLandmarks);
    return allPosesLandmarks;
  }

  Widget drawLandmarks(List<Map<String, Map<String, double>>> posesLandmarks, {double pointSize = 6.0}) {
    return CustomPaint(
      painter: _LandmarksPainter(posesLandmarks, pointSize),
      child: Container(),
    );
  }
}

class _LandmarksPainter extends CustomPainter {
  final List<Map<String, Map<String, double>>> posesLandmarks;
  final double pointSize;

  _LandmarksPainter(this.posesLandmarks, this.pointSize);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF0000)
      ..style = PaintingStyle.fill;

    for (final pose in posesLandmarks) {
      for (final landmark in pose.values) {
        final x = landmark['x'] ?? 0.0;
        final y = landmark['y'] ?? 0.0;
        canvas.drawCircle(Offset(x, y), pointSize, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

