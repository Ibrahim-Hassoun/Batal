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




// void process(CameraImage image, WorkoutProvider workoutProvider) {
//   // 1. Extract Y channel (luminance)
//   final Uint8List yBytes = image.planes[0].bytes;
//   print('[DEBUG] Y channel - First 10 bytes: ${yBytes.sublist(0, 10)}');
//   print('[DEBUG] Original Y size: ${image.width}x${image.height} (${yBytes.length} bytes)');

//   // 2. Resize Y channel directly
//   final Uint8List resizedY = resizeGrayscale(
//     yBytes,
//     image.width,
//     image.height,
//     192, // Target size for MoveNet
//   );
//   print('[DEBUG] Resized Y size: 192x192 (${resizedY.length} bytes)');
//   print('[DEBUG] Resized Y first 10 bytes: ${resizedY.sublist(0, 10)}');

//   // 3. Normalize values for model input
//   final List<double> inputTensor = resizedY.map((b) => (b / 127.5) - 1.0).toList();
//   print('[DEBUG] Tensor first 6 values: ${inputTensor.sublist(0, 6)}');
//   final output = List.filled(1 * 17 * 3, 0.0).reshape([1, 17, 3]);
//   // 4. Feed to pose detection model
//   workoutProvider.interpreter?.run(inputTensor, output);
//   final keypoints = output[0];
//   print(keypoints);
// }

// Uint8List resizeGrayscale(
//   Uint8List yBytes,
//   int originalWidth,
//   int originalHeight,
//   int targetSize,
// ) {
//   // Create grayscale image from Y channel (8-bit format)
//   final yImage = img.Image.fromBytes(
//     width:  originalWidth,
//     height:  originalHeight,
//     bytes:  yBytes.buffer,
//     format: img.Format.uint8,  // Explicit 8-bit format
//     // order: img.ChannelOrder.grayAlpha,  // Single channel
//     numChannels: 1,  // Grayscale
//   );

//   // Resize with aspect ratio preservation
//   final resizedImage = img.copyResize(
//     yImage,
//     width: targetSize,
//     height: targetSize,
//     interpolation: img.Interpolation.linear,
//   );

//   return resizedImage.getBytes();
// }






void process(CameraImage image, WorkoutProvider workoutProvider) {
  Interpreter interpreter = workoutProvider.interpreter!;
  // final inputTensor=interpreter.getInputTensors().first;
  // print('Input shape: ${inputTensor.shape}');


  // 1. Convert YUV420 to RGB
  Uint8List rgbBytes = convertYUV420toRGB(
    image.planes[0].bytes,
    image.planes[1].bytes,
    image.planes[2].bytes,
    image.width,
    image.height,
    image.planes[0].bytesPerRow,
    image.planes[1].bytesPerRow,
    image.planes[2].bytesPerRow
  );
  print("RGB bytes: ${rgbBytes.sublist(0, 10)}");
  print("Original RGB size: ${image.width}x${image.height} (${rgbBytes.length} bytes)");
  print("RGB bytes length: ${rgbBytes.length}"); // Debugging line
  // 2. Resize RGB to 192x192
  Uint8List resizedBytes = resizeRGBForModel(rgbBytes, image.width, image.height, 192);
  print("Resized RGB bytes: ${resizedBytes.sublist(0, 10)}");
  print("Resized RGB size: 192x192 (${resizedBytes.length} bytes)");

  Float32List normalizedData = convertToMoveNetInput(resizedBytes);
  print("Converted RGB bytes: ${normalizedData.sublist(0, 10)}");


  final inputBuffer = normalizedData.buffer;
  print('inputBuffer: $inputBuffer');

  final outputTensor = interpreter.getOutputTensors().first;
  final outputBuffer = Float32List(outputTensor.shape.reduce((a, b) => a * b));

  interpreter.run(inputBuffer, outputBuffer.buffer);

// Now use outputBuffer (e.g., keypoints)
  print(outputBuffer);
  
  // 3. Convert to float32 and normalize to [-1, 1]
  // Float32List inputTensor = Float32List(1 * 192 * 192 * 3);
  // for (int i = 0; i < resizedBytes.length; i++) {
  //   inputTensor[i] = (resizedBytes[i] / 127.5) - 1.0;
  // }

  // // 4. Reshape to [1, 192, 192, 3] - CRITICAL STEP!
  // var input = inputTensor.reshape([1, 192, 192, 3]);

  // // 5. Prepare output tensor
  // final output = List.filled(1 * 17 * 3, 0.0).reshape([1, 17, 3]);

  // // 6. Run inference
  // workoutProvider.interpreter?.run(input, output);

  // // 7. Get results
  // final keypoints = output[0];
  // print(keypoints);
}


Uint8List convertYUV420toRGB(
  Uint8List yPlane,
  Uint8List uPlane,
  Uint8List vPlane,
  int width,
  int height,
  int yStride,
  int uStride,
  int vStride,
) {
  final List<int> rgb = List<int>.filled(width * height * 3, 0);
//   print("Y plane first 10 bytes: ${yPlane.sublist(0, 10)}");
// print("U plane first 10 bytes: ${uPlane.sublist(0, 10)}");
// print("V plane first 10 bytes: ${vPlane.sublist(0, 10)}");
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      
      final int uvX = x ~/ 2;
      final int uvY = y ~/ 2;

      
      final int yIndex = y * yStride + x;
      final int uIndex = uvY * uStride + uvX;
      final int vIndex = uvY * vStride + uvX;

      final int yValue = yPlane[yIndex];
      final int uValue = uPlane[uIndex] - 128;
      final int vValue = vPlane[vIndex] - 128;

      // YUV → RGB conversion matrix
      int r = (yValue + (1.402 * vValue)).round();
      int g = (yValue - (0.344136 * uValue) - (0.714136 * vValue)).round();
      int b = (yValue + (1.772 * uValue)).round();

      // Clamp values and assign to RGB buffer
      final int rgbIndex = (y * width + x) * 3;
      rgb[rgbIndex] = r.clamp(0, 255);
      rgb[rgbIndex + 1] = g.clamp(0, 255);
      rgb[rgbIndex + 2] = b.clamp(0, 255);
      //  print("RGB values: ${rgb[rgbIndex]}, ${rgb[rgbIndex + 1]}, ${rgb[rgbIndex + 2]}");
    }
  }

  return Uint8List.fromList(rgb);
}

Uint8List resizeRGBForModel(
  Uint8List rgbBytes, 
  int originalWidth, 
  int originalHeight, 
  int targetSize,
) {
  // 1. Create Image from RGB bytes (CORRECTED)
  final image = img.Image.fromBytes(
    width:  originalWidth,
    height:  originalHeight,
    bytes:  rgbBytes.buffer,
    order: img.ChannelOrder.rgb,  // ← Critical fix
    format: img.Format.uint8,     // ← 8-bit per channel
  );

  // 2. Resize (already correct)
  final resizedImage = img.copyResize(
    image,
    width: targetSize,
    height: targetSize,
    interpolation: img.Interpolation.linear,
  );

  // 3. Get bytes (CORRECTED)
  return resizedImage.getBytes(
    order: img.ChannelOrder.rgb,  // ← Preserve RGB order
  );
}

Float32List convertToMoveNetInput(Uint8List uint8List) {
  final float32List = Float32List(uint8List.length);
  for (int i = 0; i < uint8List.length; i++) {
    float32List[i] = (uint8List[i] / 127.5) - 1.0; // Normalize to [-1, 1]
  }
  return float32List;
}
}