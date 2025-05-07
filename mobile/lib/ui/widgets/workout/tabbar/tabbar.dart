import 'package:flutter/material.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import 'package:mobile/main.dart';
import 'package:provider/provider.dart';

class WorkoutTabbar extends StatefulWidget {
  final String currentTab;
  const WorkoutTabbar({this.currentTab = 'my_workout'});

  @override
  _WorkoutTabbarState createState() => _WorkoutTabbarState();
}

class _WorkoutTabbarState extends State<WorkoutTabbar> {
  late String tab;

  @override
  void initState() {
    super.initState();
  
  }
  @override
  Widget build(BuildContext context) {
      tab = Provider.of<WorkoutProvider>(context, listen: true).tab;
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
             
            },
            child: Text(
              'Following',
              style: TextStyle(
                color: tab == "my_workout" ?primaryColor:text_gray,
                fontSize: 16,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
             
            },
            child: Text(
              'Following',
              style: TextStyle(
                color: tab == "my_workout" ?primaryColor:text_gray,
                fontSize: 16,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
             
            },
            child: Text(
              'Following',
              style: TextStyle(
                color: tab == "my_workout" ?primaryColor:text_gray,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: 16)]),
      ); 
  }
}