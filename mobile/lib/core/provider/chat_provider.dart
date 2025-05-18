import 'package:flutter/material.dart';
import 'package:mobile/core/remote/server.dart';
import 'package:mobile/ui/screens/chats_screen/chats_screen.dart';


class ChatProvider with ChangeNotifier{

  List<dynamic>? _conversations ;
  List<dynamic>? get conversations => _conversations;

  bool loading = true;
  
  void setConversations(List<dynamic> conversations){
    _conversations = conversations;
    notifyListeners();
  }

  void fetchConversations (ChatsScreenState chatsScreenState) async
  {
    var response = await ApiServices.request(
      endpoint: '/api/v0.1/chat/conversations/all', 
      method: "GET",
      );
    if (response['success']){
      setConversations(response['data']['data']['original']['data']);
      print('this is conversations: ');
      print(conversations);
    }
    notifyListeners();
  }
} 