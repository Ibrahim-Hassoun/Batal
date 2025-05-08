import 'package:flutter/material.dart';
import './workout_item.dart';


class MyWorkout extends StatefulWidget {
  const MyWorkout({Key? key}) : super(key: key);

  @override
  State<MyWorkout> createState() => _MyWorkoutState();
}

class _MyWorkoutState extends State<MyWorkout> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: const [
              WorkoutItem()
            
         
            ],
          ),
        ),
      );
    
     
    
  }
}