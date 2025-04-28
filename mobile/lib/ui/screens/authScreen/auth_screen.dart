import 'package:flutter/material.dart';
import '../../widgets/auth/auth_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const AuthWidget(),
    );
  }
}