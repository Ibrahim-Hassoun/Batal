import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraSection extends StatefulWidget {
  @override
  _CameraSectionState createState() => _CameraSectionState();
}

class _CameraSectionState extends State<CameraSection> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  int? _selectedCameraIdx;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Get the list of available cameras
    _cameras = await availableCameras();
    
    // Select the first camera by default (you can modify this to select the rear/front camera)
    _selectedCameraIdx = 0;

    // Initialize the camera controller
    _controller = CameraController(
      _cameras![_selectedCameraIdx!],
      ResolutionPreset.high,
      enableAudio: false,
    );

    // Initialize the camera controller
    await _controller!.initialize();

    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: Text("Camera Feed")),
      body: CameraPreview(_controller!),
    );
  }
}