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
      ResolutionPreset.low,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
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
}