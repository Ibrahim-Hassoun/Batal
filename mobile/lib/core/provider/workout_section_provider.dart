import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/widgets/workout/leaderboard/leaderboard.dart';
import 'package:mobile/ui/widgets/workout/my_workout/my_workout.dart';
import 'package:mobile/ui/widgets/workout/pose_detector/pose_detector.dart';

class WorkoutSectionProvider with ChangeNotifier{

   String _tab='pose_detector';
  String get tab =>_tab;

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
}