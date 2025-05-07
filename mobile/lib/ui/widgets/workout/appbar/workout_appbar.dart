import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import './stat_item.dart';

class WorkoutAppbar extends StatefulWidget implements PreferredSizeWidget {

  final int trophies;
  final int streak;
  final int coins;
  final int sets;

  const WorkoutAppbar({
    required this.trophies,
    required this.streak,
    required this.coins,
    required this.sets,
  });

  @override
  _WorkoutAppbarState createState() {
    return _WorkoutAppbarState();
  }
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WorkoutAppbarState extends State<WorkoutAppbar>{
  @override
  Widget build(BuildContext context) {
    return AppBar(
     backgroundColor: tertiaryColor,
      actions: [
        Expanded(
          
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatItem(icon: 'assets/house.svg', value: '${2}',color: Colors.red,),
                StatItem(icon: 'assets/house.svg', value: '${2}',color: Colors.green,),
                StatItem(icon: 'assets/house.svg', value: '${2}',color: Colors.black,),
                StatItem(icon: 'assets/house.svg', value: '${2}',color: Colors.grey,)
               ],
            ),
          ),
        ),
      ],
      
    );
  }
}