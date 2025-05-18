import 'package:flutter/material.dart';


class ConversationScreen extends StatefulWidget{
  final int conversationId;
  final int userId;
  final int secondPartyId;

  ConversationScreen({
    required this.conversationId,
    required this.userId,
    required this.secondPartyId,
  });
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversation'),
      ),
      body: Center(
        child: Text('Conversation Screen'),
      ),
    );
  }
}