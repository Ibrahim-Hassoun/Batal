import 'package:camera/camera.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import '../tensorflow/tensorflow.dart';

class CameraLogic {
TensorflowFunctions tensorflowFunctions = TensorflowFunctions();


Future<void> initializeCamera(WorkoutProvider workoutProvider) async {
    
    List<CameraDescription>? cameras = await availableCameras();
    
    
    int selectedCameraIdx = 1;

    
    workoutProvider.setController ( CameraController(
      cameras[selectedCameraIdx],
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    ));

   
    await workoutProvider.controller!.initialize();
    
    
  }


  void startStreaming(WorkoutProvider workoutProvider) async {
    await workoutProvider.controller!.startImageStream((CameraImage image) {
      // Process the image here
      tensorflowFunctions.process(image,workoutProvider);
      print('from streaming');
      
    });
  }

   void disposeCameraController(WorkoutProvider workoutProvider) {
    workoutProvider.controller!.dispose();
    
  }
}