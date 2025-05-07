import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget implements PreferredSizeWidget {
  
  @override
  _BottomNavbarState createState() => _BottomNavbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _BottomNavbarState extends State<BottomNavbar>{
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

    );
  }
}