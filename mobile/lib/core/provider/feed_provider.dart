import 'package:flutter/material.dart';
import '../../ui/screens/feedScreen/feed_screen.dart';

class FeedProvider with ChangeNotifier {
  String activeTab = 'following';

  void setActive(element){
    activeTab= element;
    notifyListeners();
  }

}
