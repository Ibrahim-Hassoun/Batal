import './camera_section.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/provider/pose_detector_provider.dart';
import 'package:mobile/main.dart';
import 'package:provider/provider.dart';
import '../../../layouts/drop_down_button.dart';
import '../../../atoms/screen_wide_elevated_button.dart';
import '../../../layouts/CustomCanva.dart';


class PoseDetectorTab extends StatefulWidget {
  const PoseDetectorTab({super.key});

  @override
  _PoseDetectorState createState() => _PoseDetectorState();
}

class _PoseDetectorState extends State<PoseDetectorTab> {
  
  @override
  Widget build(BuildContext context) {
    PoseDetectorProvider provider = Provider.of<PoseDetectorProvider>(context,listen:true);
    bool isRecording = provider.is_Recording;
    
    List<Map<String, Map<String, double>>> landmarks = provider.landmarks;
    String feedback = provider.MLFeedback;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16,top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDropdownButton(items: ['arm','option 2'],onChanged: (value){provider.setDetectedArea(value);}, label: 'Area',selectedValue: provider.detected_area,),
              CustomDropdownButton(items: ['bicep','option 2'],onChanged: (value){provider.setDetectedMuscle(value);}, label: 'Muscle',selectedValue: provider.detected_muscle,),
              CustomDropdownButton(items: ['curl','option 2'],onChanged: (value){provider.setDetectedExercice(value);}, label: 'Exercice',selectedValue: provider.detected_exercise,), 
            ],
          ),
          
        ),
        SizedBox(height: 24,),
        Expanded(//camera section
            
            child:  isRecording
            ? Padding(
              padding: const EdgeInsets.only(left: 32,right: 32),
              child: Stack(
                children: [
                CameraSection(), // The camera image
               
                
                  Padding(
                    padding: const EdgeInsets.only(left: 32,right: 32),
                    child: Positioned.fill(
                    child: CustomPaint(
                      painter: landmarks.isNotEmpty? CustomCanva(landmarks):null,
                    ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
            padding: const EdgeInsets.only(left: 32,right: 32),
            child: Container(
              color: Colors.grey[300],
              child: Center(
                child: Text("Camera not initialized"),
              ),
            ),
          ),
        ),
       
        SizedBox(height: 24,),
       
        Padding(
          padding: const EdgeInsets.only(left: 108,right: 108),
          child: ScreenWideElevatedButton(
            onPressed: () {
              provider.toggleRecording(context);
            },
            label: isRecording?'Stop':'Start',
            backgroundColor: isRecording?secondaryColor: primaryColor,
            foregroundColor: tertiaryColor,
            
          ),
        ),
         Text(feedback),
        
      ],
    );
  }
}
