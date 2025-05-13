import 'dart:typed_data';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:camera/camera.dart';
import '../../ui/widgets/workout/pose_detector/pose_detector.dart';
import '../../ui/widgets/workout/my_workout/my_workout.dart';
import '../../ui/widgets/workout/leaderboard/leaderboard.dart';
import '../tensorflow/tensorflow.dart';
import '../camera_logic/camera_logic.dart';
import '../ml_pose_detector/coaching.dart';

class WorkoutProvider with ChangeNotifier {
  final List<String> _workouts = [];
  List<String> get workouts => _workouts;
  
  String _tab='pose_detector';
  String get tab =>_tab;

  String? _detected_area='arm';
  String? get detected_area => _detected_area;

  String? _detected_muscle='biceps';
  String? get detected_muscle => _detected_muscle;

  final String? _detected_exercise ='curl';
  String? get detected_exercise => _detected_exercise;

      //general
    void changeTab(newTab){
    _tab=newTab;
    notifyListeners();
  }

  Widget provideSection(){
    if(_tab=="my_workout"){
      return const MyWorkout();
    }else if(_tab=="pose_detector"){
      return const PoseDetectorTab();
    }else if(_tab=="Leaderboard"){
      return Leaderboard();
    }else{
      return const Text("Unknown Section");
    }
  }
  


  //camera
  CameraLogic cameraLogic = CameraLogic();
  bool _is_Recording = false;
  bool get is_Recording => _is_Recording;

  CameraController? _controller;
  CameraController? get controller => _controller;

  void setController(CameraController? controller) {
    _controller = controller;
    notifyListeners();
  }

  
  Uint8List ? _imageBytes;
  Uint8List? get imageBytes => _imageBytes;

  void setImageBytes(Uint8List imageBytes) {
    _imageBytes = imageBytes;
    notifyListeners();
  }
   Uint8List ? _pngBytes;
  Uint8List? get pngBytes => _pngBytes;

  void buildPngBytes() {
     final image = img.Image.fromBytes(
    width:  192,
    height:  192,
    bytes:  _imageBytes!.buffer,
    order: img.ChannelOrder.rgb,  // ← Critical fix
    format: img.Format.uint8,     // ← 8-bit per channel
  );
    notifyListeners();
  }

  //model

  Interpreter? _interpreter;
  Interpreter? get interpreter => _interpreter;
  
  bool _modelLoaded = false;
  bool get modelLoaded => _modelLoaded;


  void setModelLoaded(bool value) {
    _modelLoaded = value;
    notifyListeners();}

  void setInterpreter(Interpreter interpreter) {
    _interpreter = interpreter;
    notifyListeners();
    
  }

  Future<void> loadModel() async {
     TensorflowFunctions().loadModel(this);
  }

  void disposeModel() {
    _interpreter!.close(); 
  }






  //head controller function
  void toggleRecording() async{
    
    if(!_is_Recording){
      
      createPoseDetector();
      // await loadModel();
      resetMLFeedback();
      await cameraLogic.initializeCamera(this);
            cameraLogic.startStreaming(this);
      _is_Recording = !_is_Recording;
      notifyListeners();
    }else{
      _is_Recording = !_is_Recording;
      // interpreter!.close();
      poseDetector!.close();
      cameraLogic.disposeCameraController(this);
      
    }
    notifyListeners();
  }



  //ml pose detector
  PoseDetector? _poseDetector;
  PoseDetector? get poseDetector => _poseDetector;

  void createPoseDetector(){
    if (_poseDetector != null) {
      return;
    }
    final options = PoseDetectorOptions();
    PoseDetector poseDetector = PoseDetector(options: options);
    _poseDetector = poseDetector;
    notifyListeners();
  }

  List<Map<String, Map<String, double>>> _landmarks = [];
  List<Map<String, Map<String, double>>> get landmarks => _landmarks;

  void setLandmarks(List<Map<String, Map<String, double>>> landmarks) {
    _landmarks = landmarks;
    notifyListeners();
  }



















  String _MLFeedback ='';
  String get MLFeedback => _MLFeedback;

  void setDetectedArea(String area) {
    _detected_area = area;
    print("this is from provider${_detected_area ?? "unknown"}");
    Coaching.area = area;
    notifyListeners();
  }

  void setDetectedMuscle(String muscle) {
    Coaching.muscle = muscle;
    _detected_muscle = muscle;
    notifyListeners();
  }

  void setDetectedExercice(String exercice) {
    Coaching.exercise = exercice;
    _detected_muscle = exercice;
    notifyListeners();
  }
  void setMLFeedback(String feedback){
    _MLFeedback+='\n';
    _MLFeedback += feedback;
    notifyListeners();
  }
  void resetMLFeedback(){
    _MLFeedback='';
    notifyListeners();
  }


  
  //my workout
  void addWorkout(String workout) {
    _workouts.add(workout);
    notifyListeners();
  }

  void removeWorkout(String workout) {
    _workouts.remove(workout);
    notifyListeners();
  }

  void clearWorkouts() {
    _workouts.clear();
    notifyListeners();
  }

  //exercices screen
  String? _selectedMode;
  String? get selectedMode=>_selectedMode;

  
  String? _selectedAreaForExercicesScreen;
  String? get selectedAreaForExercicesScreen=>_selectedAreaForExercicesScreen;

  
  String? _selectedMuscleForExercicesScreen;
  String? get selectedMuscleForExercicesScreen=>_selectedMuscleForExercicesScreen;

  

}