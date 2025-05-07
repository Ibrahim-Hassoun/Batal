import 'package:flutter/material.dart';

class BottomNavbarIcon extends StatefulWidget implements PreferredSizeWidget {
  
  @override
  _BottomNavbarIconState createState() => _BottomNavbarIconState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _BottomNavbarIconState extends State<BottomNavbarIcon>{
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

    );
  }
}