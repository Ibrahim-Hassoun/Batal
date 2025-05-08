import 'package:flutter/material.dart';

class WorkoutItem extends StatefulWidget {
  const WorkoutItem({Key? key}) : super(key: key);

  @override
  State<WorkoutItem> createState() => _WorkoutItemState();
}

class _WorkoutItemState extends State<WorkoutItem> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("My Workout"),
    );
  }
}