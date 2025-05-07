import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/bottom_navbar/bottom_navbar.dart';
import '../../../core/provider/bottom_navbar_provider.dart';

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
      bottomNavigationBar:ChangeNotifierProvider(
        create: (_)=> BottomNavbarProvider(),
        child: BottomNavbar(),
        )
      ,
    );
  }
}