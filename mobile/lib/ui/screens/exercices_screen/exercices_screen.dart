import 'package:flutter/material.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import 'package:mobile/main.dart';
import 'package:provider/provider.dart';
import '../../widgets/exercices/exercice_row_in_screen.dart';
import '../../../ui/layouts/drop_down_button.dart';
import './exercices_logic.dart';

class ExercicesScreen extends StatefulWidget{

  const ExercicesScreen({super.key});

  @override
  State<ExercicesScreen> createState() => _ExercicesScreenState();
}

class _ExercicesScreenState extends State<ExercicesScreen> {
late List<dynamic> AllExercices = [];

    @override
    void initState() {
      super.initState();
      fetchExercicesList();
    }

    Future<void> fetchExercicesList() async {
      AllExercices = await fetchExercices();
      setState(() {});
    }



  @override
  Widget build(BuildContext context) {
    WorkoutProvider provider = Provider.of<WorkoutProvider>(context,listen: true);
    


    return Scaffold(
      appBar: AppBar(
        backgroundColor: tertiaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text('Exercices')
      ),
      body: 
      Column(
        children: [
          // Scrollable content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[ 
              CustomDropdownButton(items: ['all','recommended'],onChanged: (value){provider.setSelectedMode(value);}, label: 'Mode',selectedValue: provider.selectedMode,),
              // CustomDropdownButton(items: ['arm','abs','shoulder','leg'],onChanged: (value){provider.setSelectedAreaForExercicesScreen(value);}, label: 'Area',selectedValue: provider.selectedAreaForExercicesScreen,),
              // CustomDropdownButton(items: ['option 1','option 2'],onChanged: (value){provider.setSelectedMuscleForExercicesScreen(value);}, label: 'Muscle',selectedValue: provider.selectedMuscleForExercicesScreen,)
              ],
          ),
          
          
          Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 100), 
                child: Column(
                  children: [
                    // ...exercices.map((exercice) =>
                    //   ExerciseRowInScreen(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg')
                    // ).toList()

                    
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              shrinkWrap: true,
              itemCount: AllExercices.length,
              itemBuilder: (context,index){
                 var exerciceData = AllExercices[index]; 
                 return ExerciseRowInScreen(title: exerciceData['exercice'], imageUrl: exerciceData['image_url']==null?'https://cdn-icons-png.flaticon.com/512/2331/2331943.png':exerciceData['image_url']);
              },
            ),
                  ],
                ),
              ),
            ),
          
        ],
      ),
    );
  }
}