import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier{
Map<String,dynamic>? _conversations ;
Map<String,dynamic>? get conversations => _conversations;

void setConversations(Map<String,dynamic> conversations){
  _conversations = conversations;
  notifyListeners();
}
} 