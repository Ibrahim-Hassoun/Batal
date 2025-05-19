import 'package:flutter/material.dart';
import 'package:mobile/core/provider/AuthProvider.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/atoms/screen_wide_elevated_button.dart';
import 'package:mobile/ui/layouts/drop_down_button.dart';
import 'package:provider/provider.dart';
import '../../layouts/labeled_input.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';


class Register6 extends StatelessWidget {

  const Register6({super.key});

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider= Provider.of<AuthProvider>(context,listen: true);
    final Function incrementStep=authProvider.incrementStep;
    final Function decrementStep=authProvider.decrementStep;
    final Function handleChange=authProvider.handleChange;
    
    final Map data = authProvider.data;
    
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 110),
          PlatformText("Choose your fitness level between 1\n (lowest) and 3 (highest)\n and your fitness goal",style: TextStyle(),  textAlign: TextAlign.center,),
          const SizedBox(height: 160,),
          Expanded(
            child: Center(
              
              child:Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomDropdownButton(label: 'Fitness level', onChanged: (value){handleChange('fitness_level',value);}, items: ['1','2','3']),
                      CustomDropdownButton(label: 'Fitness goal', onChanged: (value){handleChange('fitness_goal',value);}, items: ['weight loss','muscle gain','general fitness']),
                    ],
                  ),
                 
                  
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