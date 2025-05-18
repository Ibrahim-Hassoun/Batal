import 'package:mobile/ui/screens/chats_screen/conversation_screen.dart';
import '../../../core/remote/server.dart';
import 'package:flutter/material.dart';


void sendMessage(ConversationScreenState screenState) async {
  if (ConversationScreen.temp.isNotEmpty) {
    

    var response = await ApiServices.request(
      endpoint: '/api/v0.1/chatbot/send',
      method: 'POST',
      body: {
        "prompt": ConversationScreen.temp,
      },
      optimistic: () {
        screenState.setState(() {
          ConversationScreen.messages.add({
            'text': ConversationScreen.temp,
            'isMe': true,
            'time': DateTime.now().toString(),
          });
          ConversationScreen.isTyping = true;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ConversationScreen.scrollController.animateTo(
            ConversationScreen.scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      },
      rollback: () {
        screenState.setState(() {
          ConversationScreen.messages.removeLast();
        });
      },
    );

    ConversationScreen.isTyping = false;
    if (response['success']) {
      print(response['data']);
      screenState.setState(() {
        ConversationScreen.messages.add({
          'text': response['data']['data'],
          'isMe': false,
          'time': DateTime.now().toString(),
        });
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ConversationScreen.scrollController.animateTo(
          ConversationScreen.scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }
}

void clearChat(ConversationScreenState screenState) async{
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/chatbot/session',
    method: 'DELETE',
    optimistic: () {
      screenState.setState(() {
        ConversationScreen.messages.clear();
      });
    },
    rollback: () {
      screenState.setState(() {
        ConversationScreen.messages.add({
          'text': 'session not deleted',
          'isMe': false,
          'time': DateTime.now().toString(),
        });
      });
    },
  );
  screenState.setState(() {
    ConversationScreen.messages.clear();
  });
}

void loadMessages(ConversationScreenState screenState) async{
  var response = await ApiServices.request(
    endpoint: '/api/v0.1/chatbot/messages',
    method: 'GET',
  );

  if (response['success']) {
    screenState.setState(() {
      List<dynamic> messages = response['data']['data'];
      ConversationScreen.messages.clear();
      for (var msg in messages) {
        ConversationScreen.messages.add({
          'text': msg['content'],
          'isMe': msg['role'] == 'user' ? true : false,
          'time': msg['created_at'],
        });
      };
      ConversationScreen.loadingMessages=false;
    });
  } else {
    print('Error loading messages: ${response['message']}');
  }
}