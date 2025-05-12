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
          ChatbotConversationScreen.messages.add({
            'text': ChatbotConversationScreen.temp,
            'isMe': true,
            'time': DateTime.now().toString(),
          });
          ChatbotConversationScreen.isTyping = true;
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
          ChatbotConversationScreen.messages.removeLast();
        });
      },
    );

    ChatbotConversationScreen.isTyping = false;
    if (response['success']) {
      print(response['data']);
      screenState.setState(() {
        ChatbotConversationScreen.messages.add({
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

void clearChat(ChatbotConversationScreenState screenState) async{
  var response = await request(
    endpoint: '/api/v0.1/chatbot/session',
    method: 'DELETE',
    optimistic: () {
      screenState.setState(() {
        ChatbotConversationScreen.messages.clear();
      });
    },
    rollback: () {
      // Handle rollback if needed
    },
  );
  screenState.setState(() {
    ChatbotConversationScreen.messages.clear();
  });
}

void loadMessages() async{
  var response = await request(
    endpoint: '/api/v0.1/chatbot/messages',
    method: 'GET',
  );
  if (response['success']) {
    print(response['data']);
    List<dynamic> messages = response['data']['messages'];
    ChatbotConversationScreen.messages.clear();
    for (var msg in messages) {
      ChatbotConversationScreen.messages.add({
        'text': msg['text'],
        'isMe': msg['isMe'],
        'time': msg['time'],
      });
    }
  } else {
    print('Error loading messages: ${response['message']}');
  }
}