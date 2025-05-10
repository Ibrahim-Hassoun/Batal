import 'package:flutter/material.dart';


class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversation'),
        backgroundColor: null,
      ),
      body: Center(
        child: Text('Conversation Screen'),
      ),
    );
  }
}