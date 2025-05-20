import 'package:camera/camera.dart';

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
  
  double _opacity = 1;
  double _size = 90.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _size = 75.0;
      Future.delayed(const Duration(seconds: 3),(){
        _opacity = 0;
      });
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _size = 90.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _size = 90.0;
    });
  }

  void resetOpacity(){
    _opacity=1;
  }

  @override
  Widget build(BuildContext context) {
    PoseDetectorProvider workoutProvider = Provider.of<PoseDetectorProvider>(context,listen: true);
    CameraController? controller = workoutProvider.controller;

    PoseDetectorProvider provider = Provider.of<PoseDetectorProvider>(context,listen:true);
    bool isRecording = provider.is_Recording;
    
    List<Map<String, Map<String, double>>> landmarks = provider.landmarks;
    String feedback = provider.MLFeedback;
    Color borderColor = feedback.isEmpty? Colors.green:Colors.red;
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
            child:LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final cameraAspectRatio = controller!.value.aspectRatio;

              // Calculate height based on aspect ratio
              final height = screenWidth * cameraAspectRatio;

              return Stack(
                children: [
               Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  border: Border.all(
                    color: borderColor, 
                    width: 7.0, 
                  ),
                  borderRadius: BorderRadius.circular(8), // Optional: rounded corners
                ),
              ),
                GestureDetector(
                  onTap: resetOpacity,
                  child:  Center(
                      child: SizedBox(
                        width: screenWidth,
                        height: height,
                        child: CameraSection(),
                      ),
                    ),
                  
                ),

                 
                    
                     Align(
                    alignment: Alignment.centerRight,
                    child:  CustomPaint(
                      size:Size(screenWidth, height) ,
                      painter: landmarks.isNotEmpty ? CustomCanva(landmarks,cameraAspectRatio) : null,
                      
                      ),
                    ),
                    
                  

                   Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                          opacity: _opacity, 
                          duration: const Duration(milliseconds: 2000),
                          child: GestureDetector(
                            onTap: () {
                              provider.toggleRecording(context);
                            },
                            onTapDown: _onTapDown,
                            onTapUp: _onTapUp,
                            onTapCancel: _onTapCancel,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              width: _size,
                              height: _size,
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.pause, color: Colors.white),
                            ),
                          ),
                        ),
                ),
                ],
              );
            },
          ),
          )
            : Padding(
            padding: const EdgeInsets.only(left: 32,right: 32),
            child: Stack(
              children: [
                Container(
                  color: secondaryColor,
                  
                ),
               
                 Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                           onTap: () {
                             setState((){
                                _opacity=1;
                              });
                              provider.toggleRecording(context);
                             
                              
                            },
                          onTapDown: _onTapDown,
                          onTapUp: _onTapUp,
                          onTapCancel: _onTapCancel,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            width: _size,
                            height: _size,
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.play_arrow, color: Colors.white),
                          ),
                        )
                ),
              ],
            ),
          ),
        ),
       
        SizedBox(height: 24,),
       
        // Padding(
        //   padding: const EdgeInsets.only(left: 108,right: 108),
        //   child: ScreenWideElevatedButton(
        //     onPressed: () {
        //       provider.toggleRecording(context);
        //     },
        //     label: isRecording?'Stop':'Start',
        //     backgroundColor: isRecording?secondaryColor: primaryColor,
        //     foregroundColor: tertiaryColor,
            
        //   ),
        // ),
         Text(feedback),
        
      ],
    );
  }
}
