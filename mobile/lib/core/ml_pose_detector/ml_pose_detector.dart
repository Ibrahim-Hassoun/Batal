import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class MlPoseDetectorFunctions {
  get camera => null;


  void processCameraImage(CameraImage image, PoseDetector poseDetector) {
    InputImage? inputImage = _inputImageFromCameraImage(image);
    
    print(inputImage);
    
    
    detectPose(poseDetector, inputImage!);
    
  

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


  void detectPose(PoseDetector poseDetector, InputImage inputImage) async {
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
          'likelihood': landmark.likelihood,
        };
      });

      allPosesLandmarks.add(landmarksMap);
    }

    // Now allPosesLandmarks contains all landmarks with their x, y, and likelihood for each pose
    print(allPosesLandmarks);
  }



}