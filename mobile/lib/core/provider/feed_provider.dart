import 'package:flutter/material.dart';

class FeedProvider with ChangeNotifier {
  String active = 'following';

  void setActive(element){
    active = element;
    notifyListeners();
  }

}
