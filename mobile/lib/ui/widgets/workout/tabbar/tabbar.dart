import 'package:flutter/material.dart';
import 'package:mobile/core/provider/workout_provider.dart';
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
    tab = Provider.of<WorkoutProvider>(context, listen: true).tab;
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
             
            },
            child: Text(
              'Following',
              style: TextStyle(
                // color: active == "following" ? primaryColor : text_gray,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: 16)]),
      ); 
  }
}