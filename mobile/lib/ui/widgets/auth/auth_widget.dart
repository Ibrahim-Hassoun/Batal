import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mobile/ui/widgets/auth/register_1.dart';
import 'package:mobile/ui/widgets/auth/register_2.dart';
import 'package:mobile/ui/widgets/auth/register_3.dart';


class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  bool isRegistering = true;
  int currentStep = 1;
  String email = '';
  String password = '';
  String confirmPassword = '';
  String firstName = '';
  String lastName = '';
  String birthday = '';
  String username = '';
  String code='';

  void incrementStep() {
    setState(() {
      currentStep++;
    });
  }
  void decrementStep() {
    setState(() {
      currentStep--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: isRegistering?
             currentStep==1?Register1(incrementStep: incrementStep, decrementStep: decrementStep):
             currentStep==2?Register2(incrementStep: incrementStep, decrementStep: decrementStep):
             currentStep==3?Register3(incrementStep: incrementStep, decrementStep: decrementStep):null
                :
            !isRegistering? TextButton(onPressed: decrementStep, child: const Text('Back')):null
    );
  }
}