import 'package:flutter/material.dart';
import 'package:mobile/core/provider/AuthProvider.dart';
import 'package:mobile/core/provider/pose_detector_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/workout/appbar/workout_appbar.dart';
import '../../widgets/workout/tabbar/tabbar.dart';

class WorkoutScreen extends StatefulWidget{
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>{
  
  @override
  Widget build(BuildContext context) {
    WorkoutProvider workoutProvider = Provider.of<WorkoutProvider>(context, listen: true);
    final Widget CurrentSection = workoutProvider.provideSection();

    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      appBar: WorkoutAppbar(trophies: authProvider.user!['trophies_count'], streak: authProvider.user!['streak'], coins:authProvider.user!['coins'], sets: authProvider.user!['trophies_count']),
      
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WorkoutTabbar(),
                Expanded(child: CurrentSection),
              ],
            ),
          ),
        ],
      ),
     
      
    );
  }
}