import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import '../../widgets/exercices/exercice_row_in_screen.dart';

class ExercicesScreen extends StatefulWidget{

  const ExercicesScreen({super.key});

  @override
  State<ExercicesScreen> createState() => _ExercicesScreenState();
}

class _ExercicesScreenState extends State<ExercicesScreen> {

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tertiaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text('Exercices')
      ),
      body: 
      Stack(
        children: [
          // Scrollable content
          SizedBox(
            child: Positioned.fill(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 100), 
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ExerciseRowInScreen(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                    SizedBox(height: 8),
                    ExerciseRowInScreen(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                    SizedBox(height: 8),
                    ExerciseRowInScreen(title: 'title', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}