import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class ExercicesScreen extends StatelessWidget{

  const ExercicesScreen({super.key});



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
        )
    );
  }
}