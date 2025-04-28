import 'package:flutter/material.dart';
import './ui/screens/authScreen/auth_screen.dart';

const Color primaryColor =Color(0xFFF7713D);
const Color secondaryColor =Color.fromARGB(255, 31, 31, 31);
const Color tertiaryColor =Color.fromARGB(255, 255, 255, 255);
const Color bg_gray = Color(0xEEEEEEEE);
const Color text_gray = Color.fromARGB(255, 179, 179, 179);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: secondaryColor,  
          displayColor: secondaryColor, 
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.white,  
          displayColor: Colors.white, 
        ),
      ),
      
      home: AuthScreen()
    );
  }
}
