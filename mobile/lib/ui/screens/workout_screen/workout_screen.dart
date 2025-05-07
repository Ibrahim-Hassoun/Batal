import 'package:flutter/material.dart';


class WorkoutScreen extends StatefulWidget{
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Workout Screen!'),
      ),
     
      
    );
  }
}