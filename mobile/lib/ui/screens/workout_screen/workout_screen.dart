import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import '../../widgets/workout/appbar/workout_appbar.dart';
import '../../widgets/workout/tabbar/tabbar.dart';

class WorkoutScreen extends StatefulWidget{
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WorkoutAppbar(trophies: 0, streak: 0, coins: 0, sets: 0),
      
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WorkoutTabbar(),
            Text('data'),
            Text('data'),
            Container(
              color: primaryColor,
              height: 90,
            )
          ],
        ),
      ),
     
      
    );
  }
}