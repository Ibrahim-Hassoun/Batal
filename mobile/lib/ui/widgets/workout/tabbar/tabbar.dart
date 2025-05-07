import 'package:flutter/material.dart';
import '../../../../core/provider/workout_provider.dart';

class Tabbar extends StatefulWidget {
  final String currentTab;
  const Tabbar({this.currentTab = 'my_workout'});

  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Provider.of<FeedProvider>(context,listen: false).setActive("following");
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