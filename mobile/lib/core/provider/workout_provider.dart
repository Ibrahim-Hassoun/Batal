import 'package:flutter/material.dart';

class WorkoutProvider with ChangeNotifier {
  List<String> _workouts = [];
  List<String> get workouts => _workouts;

  String _tab='pose_detector';
  String get tab =>_tab;

  void changeTab(newTab){
    _tab=newTab;
    notifyListeners();
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