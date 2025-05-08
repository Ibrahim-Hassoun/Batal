import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
        hintText: 'Search',
        fillColor: bg_gray,
        filled: true,
        
          ),
          style: TextStyle(color: secondaryColor),
        ),
        backgroundColor: tertiaryColor,
      
      ),
      body: Center(
        child: Text('This is the Chats Screen'),
      ),
    );
  }
}