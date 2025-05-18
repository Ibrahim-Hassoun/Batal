import 'package:flutter/material.dart';
import 'package:mobile/core/provider/pose_detector_provider.dart';
import 'package:mobile/main.dart';
import 'package:provider/provider.dart';
import '../../widgets/exercices/exercice_row_in_screen.dart';
import '../../../ui/layouts/drop_down_button.dart';
import './exercices_logic.dart';

class ExercicesScreen extends StatefulWidget{

  const ExercicesScreen({super.key});

  @override
  State<ExercicesScreen> createState() => ExercicesScreenState();
}

class ExercicesScreenState extends State<ExercicesScreen> {

    late List<dynamic> AllExercices = [];
    late List<dynamic> recommendedExercices = [];
    bool loading = true;

    @override
    void initState() {
      super.initState();
      fetchExercicesList();
     
    }

    Future<void> fetchExercicesList() async {
      AllExercices = await fetchExercices();
      recommendedExercices = await fetchRecommendedExercices(this);
      setState(() {});
    }



  @override
  Widget build(BuildContext context) {
    PoseDetectorProvider provider = Provider.of<PoseDetectorProvider>(context,listen: true);
    String mode = provider.selectedMode!;


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
      loading?
            Center(child: CircularProgressIndicator(color: primaryColor,))
            : 
      Column(
        children: [
          // Scrollable content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[ 
              CustomDropdownButton(items: ['all','recommended'],onChanged: (value){provider.setSelectedMode(value);setState(() {
                 
              });}, label: 'Mode',selectedValue: provider.selectedMode,),
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
             

            mode=='all'?
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              shrinkWrap: true,
              
              itemCount: AllExercices.length,
              itemBuilder: (context,index){
                 var exerciceData = AllExercices[index]; 
                 return ExerciseRowInScreen(id:exerciceData['id'],title: exerciceData['exercice'], imageUrl: exerciceData['image_url'] ?? 'https://cdn-icons-png.flaticon.com/512/2331/2331943.png');
              },
            )
            :
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              shrinkWrap: true,
              
              itemCount: recommendedExercices.length,
              itemBuilder: (context,index){
                 var exerciceData = recommendedExercices[index]; 
                 return ExerciseRowInScreen(id:exerciceData['exercise']['id'],title: exerciceData['exercise']['exercice'], imageUrl: exerciceData['exercise']['image_url'] ?? 'https://cdn-icons-png.flaticon.com/512/2331/2331943.png');
              },
            )
                  ],
                ),
              ),
            ),
          
        ],
      ),
    );
  }
}