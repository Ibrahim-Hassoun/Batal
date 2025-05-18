import 'dart:convert';

import 'package:mobile/lib/time_formatter/time_formatter.dart';
import 'package:mobile/ui/screens/chats_screen/conversation_screen.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../core/remote/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String websocketURL = dotenv.env['WEBSOCKET_URL'] ?? '';

void sendMessage(ConversationScreenState screenState) async {
  if (ConversationScreen.temp.isNotEmpty) {
    
    final message = {
    "type": "private_message",
    "to": screenState.widget.secondPartyId,
    "conversationId": screenState.widget.conversationId,
    "message": ConversationScreen.temp
  };

      screenState.setState(() {
        ConversationScreen.messages.insert(0,{
          'text': ConversationScreen.temp,
          'isMe': true,
          'time': formatTimeAgo(DateTime.now()) ,
        });
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ConversationScreen.scrollController.animateTo(
          ConversationScreen.scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    
      WebSocketChannel channel = screenState.channel;
      channel.sink.add(jsonEncode(message));
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