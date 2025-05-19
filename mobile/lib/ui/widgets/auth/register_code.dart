import 'package:flutter/material.dart';
import 'package:mobile/core/provider/AuthProvider.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/atoms/screen_wide_elevated_button.dart';
import 'package:provider/provider.dart';
import '../../layouts/labeled_input.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/gestures.dart';


class RegisterCode extends StatelessWidget {

  const RegisterCode({super.key});

  @override
  Widget build(BuildContext context) {


    AuthProvider authProvider= Provider.of<AuthProvider>(context,listen: true);
    final Function incrementStep=authProvider.incrementStep;
    final Function decrementStep=authProvider.decrementStep;
    final Function handleChange=authProvider.handleChange;
    final Function setStep=authProvider.setStep;
    final Map data = authProvider.data;

    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 110),
            PlatformText(
            "We Have sent you an email to confirm\n your email address",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
            ),
          SizedBox(height: 16,),
           PlatformText(
            "Enter the code you received at:",
            style: TextStyle(
              fontSize: 16,
              color: text_gray
            ),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 8,),
            PlatformText(
            "johnDoe@domain.com",
            style: TextStyle(
              fontSize: 16,
              color: secondaryColor,
              
            ),
            textAlign: TextAlign.center,
            ),
          SizedBox(height: 8,),
          Text.rich(
            TextSpan(
              text: "or ",
              style: TextStyle(
                fontSize: 16,
                color: text_gray,
              ),
              children: [
                TextSpan(
                  text: "change email",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setStep(1);
                    },
                ),
              ],
            )
          ),
          const SizedBox(height: 160,),
          Expanded(
            child: Center(
              
              child:Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                children: [
                  LabeledInput(label: "Code", placeholder: "123456",dataKey:'code',value:data['code'],handleChange:handleChange),
                  
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