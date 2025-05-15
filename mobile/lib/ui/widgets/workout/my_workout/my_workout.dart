import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/atoms/screen_wide_elevated_button.dart';
import 'exercice_row.dart';
import './my_workout_logic.dart';

class MyWorkout extends StatefulWidget {
  const MyWorkout({super.key});

  @override
  State<MyWorkout> createState() => _MyWorkoutState();
}

class _MyWorkoutState extends State<MyWorkout> {
  late List<dynamic> exercices=[];
  bool loading = true;
  @override
  void initState() {
    
    super.initState();
    fetchExercices();
  }

  void fetchExercices()async{
    exercices = await fetchSavedExercices();
    loading = false;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
   return 
   
    Stack(
    children: [
      // Scrollable content
      loading?
      Center(child: CircularProgressIndicator(color: primaryColor,),)
      :
      exercices.isEmpty?
      Center(
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           Text('You Don\'t have Exercices yet',style: TextStyle(fontWeight: FontWeight.w300),),
           GestureDetector(
        child: Text('Add exercice', style: TextStyle(fontWeight: FontWeight.w900)),
        onTap: () => { Navigator.pushNamed(context, '/exercices') },
           ),
         ],
       ),
          )
      :
      SizedBox(
        height: 640,
        child: Positioned.fill(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
              
                ListView.builder(
                physics: const NeverScrollableScrollPhysics(), 
                shrinkWrap: true,
                
                itemCount: exercices.length,
                itemBuilder: (context,index){
                  var exerciceData = exercices[index]; 
                  return ExerciseRow(title: exerciceData['exercice'], imageUrl: exerciceData['image_url']??'https://images.unsplash.com/photo-1605296867304-46d5465a13f1',initialCount: exerciceData['pivot']['sets'],id: exerciceData['pivot']['id'],);
                },
                ),
                
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