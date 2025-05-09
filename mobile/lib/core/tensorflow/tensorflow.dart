import 'package:camera/camera.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';


class TensorflowFunctions {

Future<void> loadModel(WorkoutProvider workoutProvider) async {
  try {
    // Load the model
    Interpreter interpreter = await Interpreter.fromAsset('assets/movenet.tflite');
    workoutProvider.setInterpreter(interpreter)  ;
    workoutProvider.setModelLoaded(true);

    print("Model loaded successfully");
  } catch (e) {
    print("Error loading model: $e");
  }
}

  Future<void> analyzeFrame(CameraImage cameraImage,WorkoutProvider workoutProvider) async {
    if (workoutProvider.interpreter == null) return;

    // Convert camera image (YUV) to RGB
    var inputImage = _convertYUVToRGB(cameraImage);

    // Preprocess the image (resize and normalize)
    var input = _preprocessImage(inputImage);

    // Get model output
    var output = List.generate(1, (index) => List.filled(17, 0.0));

    workoutProvider.interpreter!.run(input, output);

    // Process the output
    return _processPoses(output);
   
  }

  // Convert YUV420 camera image to RGB
  List<List<int>> _convertYUVToRGB(CameraImage image) {
  final width = image.width;
  final height = image.height;
  final uvRowStride = image.planes[1].bytesPerRow;
  final uvPixelStride = image.planes[1].bytesPerPixel!;

  final yPlane = image.planes[0].bytes;
  final uPlane = image.planes[1].bytes;
  final vPlane = image.planes[2].bytes;

  List<List<int>> rgbImage = List.generate(
    height,
    (_) => List.filled(width * 3, 0),
  );

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      final yIndex = y * image.planes[0].bytesPerRow + x;

      final uvX = (x / 2).floor();
      final uvY = (y / 2).floor();
      final uvIndex = uvY * uvRowStride + uvX * uvPixelStride;

      final Y = yPlane[yIndex];
      final U = uPlane[uvIndex];
      final V = vPlane[uvIndex];

      // Convert YUV to RGB
      int R = (Y + 1.403 * (V - 128)).round();
      int G = (Y - 0.344 * (U - 128) - 0.714 * (V - 128)).round();
      int B = (Y + 1.770 * (U - 128)).round();

      R = R.clamp(0, 255);
      G = G.clamp(0, 255);
      B = B.clamp(0, 255);

      rgbImage[y][x * 3] = R;
      rgbImage[y][x * 3 + 1] = G;
      rgbImage[y][x * 3 + 2] = B;
    }
  }

  return rgbImage;
}


  // Preprocess image before passing to the model (resize, normalize, etc.)

  // List<List<List<int>>> _preprocessImage(List<List<int>> inputImage) {
  //   // Resize image to 192x192 or model's expected size
  //   // Normalize pixel values if required
  //   return inputImage;
  // }

  // Convert model output into a list of poses (keypoints)

  // List<List<double>> _processPoses(List output) {
  //   // Process the model output (17 keypoints) and return a list
  //   return output;
  // }

}