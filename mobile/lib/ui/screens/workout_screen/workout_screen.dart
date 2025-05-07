import 'package:flutter/material.dart';
import '../../widgets/workout/appbar/workout_appbar.dart';

class WorkoutScreen extends StatefulWidget{
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WorkoutAppbar(trophies: 0, streak: 0, coins: 0, sets: 0),
      body: Center(
        child: Text('Welcome to the Workout Screen!'),
      ),
     
      
    );
  }
}