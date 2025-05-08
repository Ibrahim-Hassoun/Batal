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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: secondaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: TextField(
          decoration: InputDecoration(
        hintText: 'Search',
        fillColor: bg_light_gray,
        filled: true,
        border: InputBorder.none,
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