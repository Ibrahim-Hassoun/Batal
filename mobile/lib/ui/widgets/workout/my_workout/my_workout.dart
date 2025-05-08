import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/atoms/screen_wide_elevated_button.dart';
import 'exercice_row.dart';


class MyWorkout extends StatefulWidget {
  const MyWorkout({Key? key}) : super(key: key);

  @override
  State<MyWorkout> createState() => _MyWorkoutState();
}

class _MyWorkoutState extends State<MyWorkout> {
  @override
  Widget build(BuildContext context) {
   return  Stack(
    children: [
      // Scrollable content
      SizedBox(
        height: 640,
        child: Positioned.fill(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 100), // Space for button
            child: Column(
              children: [
                SizedBox(height: 20),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                ExerciseRow(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                SizedBox(height: 40),
                // Your content here
              ],
            ),
          ),
        ),
      ),

      // Fixed button at bottom
      Positioned(
        bottom: 20,
        left: 20,
        right: 20,
        child: Padding(
          padding: const EdgeInsets.only(left: 90,right: 90),
          child: ScreenWideElevatedButton(label: 'Check-in gym', onPressed: (){}, backgroundColor: primaryColor, foregroundColor: tertiaryColor),
        )
      ),
    ],
  );
    
     
    
  }
}