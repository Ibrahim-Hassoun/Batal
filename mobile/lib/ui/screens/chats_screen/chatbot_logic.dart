import '../../../core/remote/server.dart';
import 'package:flutter/material.dart';
import './chatbot_conversation_screen.dart';

void sendMessage(ChatbotConversationScreenState screenState) async {
  if (ChatbotConversationScreen.temp.isNotEmpty) {
    

    var response = await request(
      endpoint: '/api/v0.1/chatbot/send',
      method: 'POST',
      body: {
        "prompt": ChatbotConversationScreen.temp,
      },
      optimistic: () {
        screenState.setState(() {
          ChatbotConversationScreenState.messages.add({
            'text': ChatbotConversationScreen.temp,
            'isMe': true,
            'time': DateTime.now().toString(),
          });
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ChatbotConversationScreen.scrollController.animateTo(
            ChatbotConversationScreen.scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      },
      rollback: () {
        screenState.setState(() {
          ChatbotConversationScreenState.messages.removeLast();
        });
      },
    );

    if (response['success']) {
      print(response['data']);
      screenState.setState(() {
        ChatbotConversationScreenState.messages.add({
          'text': response['data']['data'],
          'isMe': false,
          'time': DateTime.now().toString(),
        });
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ChatbotConversationScreen.scrollController.animateTo(
          ChatbotConversationScreen.scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }
}