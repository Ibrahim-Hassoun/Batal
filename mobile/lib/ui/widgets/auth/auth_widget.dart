import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mobile/ui/widgets/auth/register_1.dart';
import 'package:mobile/ui/widgets/auth/register_2.dart';
import 'package:mobile/ui/widgets/auth/register_3.dart';
import 'package:mobile/ui/widgets/auth/register_4.dart';
import 'package:mobile/ui/widgets/auth/register_5.dart';
import 'package:mobile/ui/widgets/auth/register_6.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/AuthProvider.dart'; 
import './login.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  bool isRegistering = true;
  int currentStep = 1;
  final data = {
    'email': '',
    'password': '',
    'confirmPassword': '',
    'firstName': '',
    'lastName': '',
    'birthday': '',
    'username': '',
    'code': ''
  };
  late bool hasAccount;
  void incrementStep() {
    setState(() {
      if(currentStep<6){
        currentStep++;
      }
    });
  }
  void decrementStep() {
    setState(() {
      currentStep--;
    });
  }
  void setStep(step) {
    setState(() {
      currentStep=step;
    });
  }
  void handleChange(key,value){
    setState(() {
      data[key] = value;
    });
  }
  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    hasAccount = Provider.of<AuthProvider>(context, listen: true).hasAccount;
     
    return PlatformScaffold(
      body: !hasAccount?
            currentStep==1?Register1(incrementStep: incrementStep, decrementStep: decrementStep,data:data,handleChange:handleChange):
            currentStep==2?Register2(incrementStep: incrementStep, decrementStep: decrementStep,data:data,handleChange:handleChange):
            currentStep==3?Register3(incrementStep: incrementStep, decrementStep: decrementStep,data:data,handleChange:handleChange):
            currentStep==4?Register4(incrementStep: incrementStep, decrementStep: decrementStep,data:data,handleChange:handleChange):
            currentStep==5?Register5(incrementStep: incrementStep, decrementStep: decrementStep,data:data,handleChange:handleChange):
            currentStep==6?Register6(incrementStep: incrementStep, decrementStep: decrementStep,setStep:setStep,data:data,handleChange:handleChange):null
                :
            hasAccount?Login(incrementStep: incrementStep, decrementStep: decrementStep, data: data, handleChange: handleChange):null
    );
  }
}