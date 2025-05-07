import 'package:flutter/material.dart';

class WorkoutAppbar extends StatefulWidget{

  final String trophies;
  final String streak;
  final String coins;
  final String sets;

  const WorkoutAppbar({
    required this.trophies,
    required this.streak,
    required this.coins,
    required this.sets,
  });

  @override
  _WorkoutAppbarState createState() {
    return _WorkoutAppbarState();
  }
}

class _WorkoutAppbarState extends State<WorkoutAppbar>{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Workout Appbar'),
    );
  }
}