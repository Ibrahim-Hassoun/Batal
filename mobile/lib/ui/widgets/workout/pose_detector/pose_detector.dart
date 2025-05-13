import 'dart:typed_data';
import './camera_section.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/provider/workout_provider.dart';
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
    WorkoutProvider provider = Provider.of<WorkoutProvider>(context,listen:true);
    bool isRecording = provider.is_Recording;
    Uint8List? pngBytes = provider.imageBytes;
    List<Map<String, Map<String, double>>> landmarks = provider.landmarks;
    String feedback = provider.MLFeedback;

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
            width: 300, 
            height: 350,
            child:  isRecording
            ? Stack(
              children: [
              CameraSection(), // The camera image
              if (pngBytes != null)
                Positioned.fill(
                child: IgnorePointer(
                  child: Image.memory(
                  pngBytes,
                  fit: BoxFit.cover,
                  ),
                ),
                ),
              
                Positioned.fill(
                child: CustomPaint(
                  painter: landmarks.isNotEmpty? CustomCanva(landmarks):null,
                ),
                ),
              ],
            )
          : Container(
            color: Colors.grey[300],
            child: Center(
              child: Text("Camera not initialized"),
            ),
          ),
        ),
       
        SizedBox(height: 24,),
        Text(feedback),
        Padding(
          padding: const EdgeInsets.only(left: 108,right: 108),
          child: ScreenWideElevatedButton(
            onPressed: () {
              provider.toggleRecording();
            },
            label: isRecording?'Stop':'Start',
            backgroundColor: isRecording?secondaryColor: primaryColor,
            foregroundColor: tertiaryColor,
            
          ),
        ),
        
      ],
    );
  }
}
