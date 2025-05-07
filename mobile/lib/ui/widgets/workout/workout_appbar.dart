import 'package:flutter/material.dart';

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
     
      actions: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.emoji_events, color: Colors.yellow),
                  Text('${widget.trophies}'),
                ],
              ),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_fire_department, color: Colors.red),
                  Text('${widget.streak}'),
                ],
              ),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.monetization_on, color: Colors.green),
                  Text('${widget.coins}'),
                ],
              ),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fitness_center, color: Colors.blue),
                  Text('${widget.sets}'),
                ],
              ),
            ],
          ),
        ),
      ],
      
    );
  }
}