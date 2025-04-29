import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import '../../layouts/labeled_input.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Register1 extends StatelessWidget {
  final Function incrementStep;
  final Function decrementStep;
  final Function handleChange;
  final Map data;

  const Register1({super.key,required this.incrementStep,required this.decrementStep,required this.data,required this.handleChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 110),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              PlatformText(
                'Batal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 56),
              PlatformText(
                'Create an account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              PlatformText(
                'Enter your email to sign up for this app',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 24),
              LabeledInput(label: 'Email', placeholder: 'email@domain.com',dataKey:'email',value:data['email'],handleChange:handleChange),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    child: PlatformElevatedButton(
                      onPressed: () {incrementStep();},
                      color: bg_gray,
                      material: (_, __) => MaterialElevatedButtonData(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor,
                          foregroundColor: tertiaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      cupertino: (_, __) => CupertinoElevatedButtonData(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: 
                          PlatformText('Next',style: TextStyle(fontSize: 20),),
                        
                      
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: PlatformText(
                        'OR',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: PlatformElevatedButton(
                      onPressed: () {},
                      color: bg_gray,
                      material: (_, __) => MaterialElevatedButtonData(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      cupertino: (_, __) => CupertinoElevatedButtonData(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                          backgroundImage: AssetImage('assets/google.png'),
                          radius: 12,  // adjust size
                          ),
                          const SizedBox(width: 8),
                          PlatformText('Continue with Google'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PlatformElevatedButton(
                      onPressed: () {},
                      color: bg_gray,
                      material: (_, __) => MaterialElevatedButtonData(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      cupertino: (_, __) => CupertinoElevatedButtonData(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                          backgroundImage: AssetImage('assets/apple.jpg'),
                          radius: 12,  // adjust size
                          ),
                          const SizedBox(width: 8),
                          PlatformText('Continue with Apple'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              PlatformText(
                'By clicking continue, you agree to our Terms of Service and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: text_gray,
                ),
              ),
            ],
          ),
        ),
      );
    }}