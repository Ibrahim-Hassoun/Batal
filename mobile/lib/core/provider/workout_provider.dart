import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:camera/camera.dart';
import '../../ui/widgets/workout/pose_detector/pose_detector.dart';
import '../../ui/widgets/workout/my_workout/my_workout.dart';
import '../../ui/widgets/workout/leaderboard/leaderboard.dart';
import '../../ui/widgets/workout/pose_detector/camera_section.dart' as pose_detector;
import '../tensorflow/tensorflow.dart';
import '../camera_logic/camera_logic.dart';

class WorkoutProvider with ChangeNotifier {
  List<String> _workouts = [];
  List<String> get workouts => _workouts;
  
  String _tab='pose_detector';
  String get tab =>_tab;

  String? _detected_area;
  String? get detected_area => _detected_area;

  String? _detected_muscle;
  String? get detected_muscle => _detected_muscle;

  String? _detected_exercise;
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
      return const PoseDetector();
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

  



 

  //pose detector

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

  void toggleRecording() async{
    
    if(!_is_Recording){
      print('we will try to launch the modellllllllllllllllllllllllllllllllllllllllll');
      await loadModel();
      await cameraLogic.initializeCamera(this);
            cameraLogic.startStreaming(this);
      _is_Recording = !_is_Recording;
      notifyListeners();
    }else{
      print('we will try to stop the modellllllllllllllllllllllllllllllllllllllllll');
      disposeModel();
      cameraLogic.disposeCameraController(this);
      _is_Recording = !_is_Recording;
    }
    notifyListeners();
  }



























  void setDetectedArea(String area) {
    _detected_area = area;
    print("this is from provider" + (_detected_area ?? "unknown"));
    notifyListeners();
  }

  void setDetectedMuscle(String muscle) {
    _detected_muscle = muscle;
    notifyListeners();
  }

  void setDetectedExercice(String exercice) {
    _detected_muscle = exercice;
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
}