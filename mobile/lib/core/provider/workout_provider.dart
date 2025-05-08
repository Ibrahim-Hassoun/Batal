import 'package:flutter/material.dart';
import '../../ui/widgets/workout/pose_detector/pose_detector.dart';
import '../../ui/widgets/workout/my_workout/my_workout.dart';

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
      return const Text("Leaderboard");
    }else{
      return const Text("Unknown Section");
    }
  }

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