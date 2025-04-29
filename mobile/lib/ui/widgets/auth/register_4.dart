import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/atoms/screen_wide_elevated_button.dart';
import '../../layouts/labeled_input.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';


class Register4 extends StatelessWidget {
  final Function incrementStep;
  final Function decrementStep;
  final Function handleChange;
  final Map data;

  const Register4({super.key,required this.incrementStep,required this.decrementStep,required this.data,required this.handleChange});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 110),
          PlatformText("Insert Your Date of Birth"),
          const SizedBox(height: 160,),
          Expanded(
            child: Center(
              
              child:Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                children: [
                  LabeledInput(label: "Birthdate", placeholder: "1/1/1999",dataKey:'birthday',value:data['birthday'],handleChange:handleChange,keyboardType: TextInputType.datetime,),
                  
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