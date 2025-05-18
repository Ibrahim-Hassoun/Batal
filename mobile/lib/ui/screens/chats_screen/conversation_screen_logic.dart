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
          ConversationScreen.messages.insert(0,{
            'text': ConversationScreen.temp,
            'isMe': true,
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
      },
      rollback: () {
       
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


void loadMessages (int userId,ConversationScreenState screenState,int conversationId) async{
  ConversationScreen.loadingMessages=true;
  ConversationScreen.messages.clear();
print(conversationId);
  var response = await ApiServices.request(
    
    endpoint: '/api/v0.1/chat/conversations/$conversationId/messages',
    method: 'GET',
  );
    
  if (response['success']) {
    screenState.setState(() {
      List<dynamic> messages = response['data']['data']['data'];
      
      for (var msg in messages) {
        ConversationScreen.messages.add({
          'text': msg['content'],
          'isMe': msg['sender_id']==userId ? true : false,
          'time': msg['created_at'],
        });
      }
      ConversationScreen.loadingMessages=false;
      print('messages: ');
      print(messages);
    });
  } else {
    print('Error loading messages: ${response['message']}');
  }
}