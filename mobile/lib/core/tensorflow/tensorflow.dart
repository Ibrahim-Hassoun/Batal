import 'dart:typed_data';

import 'package:mobile/core/provider/workout_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;

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

void test(){
  print("this is a test function");
}


void process(CameraImage image){
  print("this is the format of the image");
  Uint8List rgbImage = convertYUV420toRGB(image.planes[0].bytes,image.planes[1].bytes,image.planes[2].bytes,image.width,image.height,);
  
 
}

Uint8List convertYUV420toRGB(Uint8List yPlane, Uint8List uPlane, Uint8List vPlane, int width, int height) {
  final int uvWidth = width ~/ 2;
  final int uvHeight = height ~/ 2;
  final List<int> rgb = List<int>.filled(width * height * 3, 0);

  int yIndex = 0;
  int uvIndex = 0;
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      final int uvX = x ~/ 2;
      final int uvY = y ~/ 2;
      final int uvOffset = uvY * uvWidth + uvX;

      final int yValue = yPlane[yIndex];
      final int uValue = uPlane[uvOffset] - 128;
      final int vValue = vPlane[uvOffset] - 128;

      // YUV → RGB conversion matrix
      int r = (yValue + (1.402 * vValue)).round();
      int g = (yValue - (0.344 * uValue) - (0.714 * vValue)).round();
      int b = (yValue + (1.772 * uValue)).round();

      r = r.clamp(0, 255);
      g = g.clamp(0, 255);
      b = b.clamp(0, 255);

      final int rgbIndex = (y * width + x) * 3;
      rgb[rgbIndex] = r;
      rgb[rgbIndex + 1] = g;
      rgb[rgbIndex + 2] = b;

      yIndex++;
    }
  }
  return Uint8List.fromList(rgb);
}

}