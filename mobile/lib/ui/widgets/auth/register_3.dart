import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/atoms/screen_wide_elevated_button.dart';
import '../../layouts/labeled_input.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';


class Register3 extends StatelessWidget {
  final Function incrementStep;
  final Function decrementStep;
  
  const Register3({super.key,required this.incrementStep,required this.decrementStep});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 110),
          PlatformText("Insert Profile Information"),
          const SizedBox(height: 160),
          Expanded(
            child: Center(
              
              child:Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                children: [
                  LabeledInput(label: "First Name", placeholder: "John"),
                  SizedBox(height: 16),
                  LabeledInput(label: "Last Name", placeholder: "Doe"),
                  SizedBox(height: 16),
                  ScreenWideElevatedButton(label: 'Back',onPressed:(){decrementStep();},backgroundColor: bg_gray,foregroundColor: secondaryColor),
                  SizedBox(height: 16),
                  ScreenWideElevatedButton(label: 'Next',onPressed:(){incrementStep();},backgroundColor: secondaryColor,foregroundColor: tertiaryColor),
                  ],
              ),
              ) 
            ),
          ),
        ],
      ),
    );
  }
  }