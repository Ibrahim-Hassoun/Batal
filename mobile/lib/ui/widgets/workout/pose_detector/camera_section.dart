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
    
    _cameras = await availableCameras();
    
    
    _selectedCameraIdx = 1;

    
    _controller = CameraController(
      _cameras![_selectedCameraIdx!],
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

   
    await _controller!.initialize();
    startStreaming();
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void startStreaming() async {
  await _controller!.startImageStream((CameraImage image) {
    // Process the image here
    print('Received image with ${image.planes.length} planes');
  });
}
  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
    
      body: CameraPreview(_controller!),
    );
  }
}