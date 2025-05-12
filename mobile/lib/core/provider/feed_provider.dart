import 'package:flutter/material.dart';

class FeedProvider with ChangeNotifier {
  String activeTab = 'following';

  void setActive(element){
    activeTab= element;
    notifyListeners();
  }

  void loadPosts(){
    
  }
}
