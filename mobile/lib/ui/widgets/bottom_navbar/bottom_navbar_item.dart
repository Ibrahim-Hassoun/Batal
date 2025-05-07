import 'package:flutter/material.dart';

class BottomNavbarItem extends StatefulWidget implements PreferredSizeWidget {
  
  @override
  _BottomNavbarItemState createState() => _BottomNavbarItemState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _BottomNavbarItemState extends State<BottomNavbarItem>{
  @override
  Widget build(BuildContext context) {
    return Column(
        
    );
  }
}