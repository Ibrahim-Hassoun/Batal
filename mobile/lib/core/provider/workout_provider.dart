import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import '../../ui/widgets/workout/pose_detector/pose_detector.dart';
import '../../ui/widgets/workout/my_workout/my_workout.dart';
import '../../ui/widgets/workout/leaderboard/leaderboard.dart';
import '../../ui/widgets/workout/pose_detector/camera_section.dart' as pose_detector;

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

  bool _is_Recording = false;
  bool get is_Recording => _is_Recording;

  Widget CameraSection =  pose_detector.CameraSection();

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
  

  //pose detector

  Interpreter? _interpreter;
  Interpreter? get interpreter => _interpreter;

  bool _modelLoaded = false;
  bool get modelLoaded => _modelLoaded;

   Future<void> _loadModel() async {
    try {
      // Load the model using tflite_flutter Interpreter
      _interpreter = await Interpreter.fromAsset('assets/movenet.tflite');

      _modelLoaded = true;
      notifyListeners(); 

      print("Model loaded successfully!");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  void disposeModel() {
    _interpreter?.close(); 
    super.dispose();
  }

  Widget provideCameraSection(){
    return pose_detector.CameraSection();
  }

  void toggleRecording() {
    _is_Recording = !_is_Recording;
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