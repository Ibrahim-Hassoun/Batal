import 'package:flutter/material.dart';
import './bottom_navbar_item.dart';
import '../../screens/feedScreen/feed_screen.dart';
import '../../screens/workout_screen/workout_screen.dart';

class BottomNavbar extends StatefulWidget implements PreferredSizeWidget {
  const BottomNavbar({super.key});

  
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
              child:   BottomNavbarItem(icon: 'assets/house.svg',label: 'Home',widget: FeedScreen(),state: 'feed',),
            ),
            SizedBox(
              height: 50,
              child:   BottomNavbarItem(icon: 'assets/compass.svg',label: 'Explore',widget: FeedScreen(),state: 'explore'),
            ),
            SizedBox(
              height: 50,
              child:   BottomNavbarItem(icon: 'assets/shopping-cart.svg',label: 'Shop',widget: FeedScreen(),state: 'shop'),
            ),
            SizedBox(
              height: 50,
              child:   BottomNavbarItem(icon: 'assets/dumbbell.svg',label: 'Workout',widget: WorkoutScreen(),state: 'workout'),
            ),
           
            SizedBox(
              height: 50,
              child:   BottomNavbarItem(icon: 'assets/user.svg',label: 'Profile',widget: WorkoutScreen(),state: 'profile'),
            ),
          
            
        ],),
        
    );
  }
}