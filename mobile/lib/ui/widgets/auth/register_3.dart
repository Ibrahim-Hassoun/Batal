import 'package:flutter/material.dart';
import 'package:mobile/core/provider/AuthProvider.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/atoms/screen_wide_elevated_button.dart';
import 'package:provider/provider.dart';
import '../../layouts/labeled_input.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';


class Register3 extends StatelessWidget {
  
  const Register3({super.key});

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
          PlatformText("Insert Profile Information"),
          const SizedBox(height: 160),
          Expanded(
            child: Center(
              
              child:Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                children: [
                  LabeledInput(label: "First Name", placeholder: "John",dataKey:'first_name',value:data['first_name'],handleChange:handleChange),
                  SizedBox(height: 16),
                  LabeledInput(label: "Last Name", placeholder: "Doe",dataKey:'last_name',value:data['last_name'],handleChange:handleChange),
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