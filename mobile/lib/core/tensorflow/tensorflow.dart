import 'package:camera/camera.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img; // For image manipulation
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

   Future<List<double>?> processCameraFrame(
    CameraImage cameraImage, WorkoutProvider workoutProvider) async {
  if (!workoutProvider.modelLoaded || workoutProvider.interpreter == null) {
    print('MoveNet model not loaded yet.');
    return null;
  }

  final interpreter = workoutProvider.interpreter!;

  final inputImage = _convertCameraImage(cameraImage, interpreter);
  if (inputImage != null) {
    final outputShape = interpreter.outputTensors.first.shape; // Typically [1, 1, 17, 3]
    final outputBuffer = TensorBuffer.createFixedSize(outputShape, TfLiteType.float32);

    final inputs = [inputImage.buffer];
    final outputs = {0: outputBuffer.buffer};

    interpreter.runForMultipleInputsOutputs(inputs, outputs);
    final rawPoses = outputBuffer.getDoubleList();
    return rawPoses;
  } else {
    return null;
  }
}

// Helper function to convert CameraImage to TensorBuffer
TensorBuffer? _convertCameraImage(
    CameraImage image, Interpreter interpreter) {
  try {
    img.Image? convertedImage;
    if (image.format.group == ImageFormatGroup.yuv420) {
      convertedImage = _convertYUV420(image);
    } else if (image.format.group == ImageFormatGroup.nv21) {
      convertedImage = _convertNV21(image);
    } else {
      print("Unsupported image format: ${image.format.group}");
      return null; // Handle other formats if needed
    }

    if (convertedImage != null) {
      // Get input tensor shape to determine required width and height
      final inputShape = interpreter.getInputTensor(0).shape;
      final inputWidth = inputShape[1];
      final inputHeight = inputShape[2];

      final resizedImage =
          img.copyResize(convertedImage, width: inputWidth, height: inputHeight);
      final inputBytes = resizedImage.getBytes();
      final inputBuffer =
          TensorBuffer.createFixedSize(inputShape, TfLiteType.uint8);
      inputBuffer.loadUint8List(inputBytes);
      return inputBuffer;
    }
  } catch (e) {
    print("Error converting camera image: $e");
  }
  return null;
}

img.Image _convertYUV420(CameraImage image) {
  final width = image.width;
  final height = image.height;
  final yRowStride = image.planes[0].bytesPerRow;
  final uvRowStride = image.planes[1].bytesPerRow;
  final uvPixelStride = image.planes[1].bytesPerPixel!;

  final img.Image rgbImage = img.Image(width: width, height: height);

  for (int y = 0; y < height; y++) {
    final vPtr = image.planes[2].bytes.buffer.asUint8List(
        y * uvRowStride, width ~/ 2 * uvPixelStride);
    final uPtr = image.planes[1].bytes.buffer.asUint8List(
        y * uvRowStride, width ~/ 2 * uvPixelStride);
    final yPtr =
        image.planes[0].bytes.buffer.asUint8List(y * yRowStride, width);

    for (int x = 0; x < width; x++) {
      final int yIndex = y * width + x;
      final int uvIndex = y ~/ 2 * width ~/ 2 + x ~/ 2;

      final int Y = yPtr[x] & 0xff;
      final int U = uPtr[x ~/ 2 * uvPixelStride + 0] & 0xff;
      final int V = vPtr[x ~/ 2 * uvPixelStride + (uvPixelStride == 2 ? 1 : 0)] & 0xff;

      int r = (Y + V * 1436 / 1024 - 179).round().clamp(0, 255);
      int g = (Y - U * 46549 / 131072 + 44 - V * 93638 / 131072 + 91)
          .round()
          .clamp(0, 255);
      int b = (Y + U * 1814 / 1024 - 227).round().clamp(0, 255);

      rgbImage.setPixelRgb(x, y, r, g, b);
    }
  }
  return rgbImage;
}

img.Image _convertNV21(CameraImage image) {
  final width = image.width;
  final height = image.height;
  final yBuffer = image.planes[0].bytes;
  final uvBuffer = image.planes[1].bytes;
  final img.Image rgbImage = img.Image(width: width, height: height);

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      final int yIndex = y * width + x;
      final int uvIndex = y ~/ 2 * width + (x ~/ 2) * 2;

      final int Y = yBuffer[yIndex] & 0xff;
      final int U = uvBuffer[uvIndex + 0] & 0xff;
      final int V = uvBuffer[uvIndex + 1] & 0xff;

      int r = (Y + V * 1436 / 1024 - 179).round().clamp(0, 255);
      int g = (Y - U * 46549 / 131072 + 44 - V * 93638 / 131072 + 91)
          .round()
          .clamp(0, 255);
      int b = (Y + U * 1814 / 1024 - 227).round().clamp(0, 255);

      rgbImage.setPixelRgb(x, y, r, g, b);
    }
  }
  return rgbImage;
}
}