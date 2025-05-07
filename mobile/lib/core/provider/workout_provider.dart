import 'package:flutter/material.dart';

class WorkoutProvider with ChangeNotifier {
  List<String> _workouts = [];
  List<String> get workouts => _workouts;

  String tab='my_workout';

  void changeTab(newTab){
    tab=newTab;
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