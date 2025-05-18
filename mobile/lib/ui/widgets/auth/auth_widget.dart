import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mobile/ui/widgets/auth/register_1.dart';
import 'package:mobile/ui/widgets/auth/register_2.dart';
import 'package:mobile/ui/widgets/auth/register_3.dart';
import 'package:mobile/ui/widgets/auth/register_4.dart';
import 'package:mobile/ui/widgets/auth/register_5.dart';
import 'package:mobile/ui/widgets/auth/register_6.dart';
// import 'package:mobile/ui/widgets/auth/register_code.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/AuthProvider.dart'; 
import './login.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
 
  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: true);
    bool hasAccount = authProvider.hasAccount;
    int currentStep = authProvider.currentStep;

    return PlatformScaffold(
      body: !hasAccount?
            currentStep==1?Register1():
            currentStep==2?Register2():
            currentStep==3?Register3():
            currentStep==4?Register4():
            currentStep==5?Register5():
            currentStep==6?Register6():null
                :
            hasAccount? Login():null
    );
  }
}