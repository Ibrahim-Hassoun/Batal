import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/main.dart';
import './bottom_navbar_item.dart';

class BottomNavbar extends StatefulWidget implements PreferredSizeWidget {
  
  @override
  _BottomNavbarState createState() => _BottomNavbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _BottomNavbarState extends State<BottomNavbar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      height: 56,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 31, 30, 31),
        borderRadius: BorderRadius.circular(15),
      ),
      child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child:   BottomNavbarItem(icon: 'assets/house.svg',label: 'Home',route: '/feed',active: 'feed',),
            ),
            SizedBox(
              height: 50,
              child:   BottomNavbarItem(icon: 'assets/compass.svg',label: 'Explore',route: '/feed',active: 'feed'),
            ),
            SizedBox(
              height: 50,
              child:   BottomNavbarItem(icon: 'assets/shopping-cart.svg',label: 'Shop',route: '/feed',active: 'feed'),
            ),
            SizedBox(
              height: 50,
              child:   BottomNavbarItem(icon: 'assets/dumbbell.svg',label: 'Workout',route: '/feed',active: 'feed'),
            ),
            SizedBox(
              height: 50,
              child:   BottomNavbarItem(icon: 'assets/bell.svg',label: 'Notifications',route: '/feed',active: 'feed'),
            ),
            SizedBox(
              height: 50,
              child:   BottomNavbarItem(icon: 'assets/user.svg',label: 'Profile',route: '/feed',active: 'feed'),
            ),
          
            
        ],),
        
    );
  }
}