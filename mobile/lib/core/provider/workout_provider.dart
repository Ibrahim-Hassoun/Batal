import 'package:flutter/material.dart';
import '../../ui/widgets/workout/pose_detector/pose_detector.dart';

class WorkoutProvider with ChangeNotifier {
  List<String> _workouts = [];
  List<String> get workouts => _workouts;

  String _tab='pose_detector';
  String get tab =>_tab;

  void changeTab(newTab){
    _tab=newTab;
    notifyListeners();
  }

  Widget provideSection(){
    if(_tab=="my_workout"){
      return const Text("Pose Detector Section");
    }else if(_tab=="pose_detector"){
      return const PoseDetector();
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