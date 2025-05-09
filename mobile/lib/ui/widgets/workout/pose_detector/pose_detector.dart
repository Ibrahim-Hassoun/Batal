import 'package:flutter/material.dart';
import 'package:mobile/core/provider/workout_provider.dart';
import 'package:mobile/main.dart';
import 'package:provider/provider.dart';
import '../../../layouts/drop_down_button.dart';
import '../../../atoms/screen_wide_elevated_button.dart';
import './camera_section.dart';

class PoseDetector extends StatefulWidget {
  const PoseDetector({Key? key}) : super(key: key);

  @override
  _PoseDetectorState createState() => _PoseDetectorState();
}

class _PoseDetectorState extends State<PoseDetector> {
  
  @override
  Widget build(BuildContext context) {
    WorkoutProvider provider = Provider.of<WorkoutProvider>(context,listen:true);
    bool is_recording = provider.is_Recording;

    return Column(
      children: [
        Padding(//selections wrapper
          padding: EdgeInsets.only(left: 16, right: 16,top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [//selections
              CustomDropdownButton(items: ['option 1','option 2'],onChanged: (value){provider.setDetectedArea(value);}, label: 'Area',selectedValue: provider.detected_area,),
              CustomDropdownButton(items: ['option 1','option 2'],onChanged: (value){provider.setDetectedMuscle(value);}, label: 'Muscle',selectedValue: provider.detected_muscle,),
              CustomDropdownButton(items: ['option 1','option 2'],onChanged: (value){provider.setDetectedArea(value);}, label: 'Exercice',selectedValue: provider.detected_exercise,),
            
             
            ],
          ),
          
        ),
        SizedBox(height: 24,),
        SizedBox(//camera section
            height: 550,
            child:  is_recording?
          provider.provideCameraSection()
          : 
          Container(
            
            width: 300,
            color: Colors.grey[300],
            child: Center(
              child: Text("Camera not initialized"),
            ),
          ),
        ),
       
        SizedBox(height: 24,),
        
        Padding(
          padding: const EdgeInsets.only(left: 108,right: 108),
          child: ScreenWideElevatedButton(
            onPressed: () {
              provider.toggleRecording();
            },
            label: 'Start',
            backgroundColor: primaryColor,
            foregroundColor: tertiaryColor,
            
          ),
        ),
      ],
    );
  }
}