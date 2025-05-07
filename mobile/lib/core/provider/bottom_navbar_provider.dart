import 'package:flutter/widgets.dart';
import '../../ui/screens/feedScreen/feed_screen.dart';

class BottomNavbarProvider with ChangeNotifier{
  String _activeState='feed';
  String get activeState=>_activeState;

  Widget _current_screen = FeedScreen();
  Widget get current_screen => _current_screen;

  void changeState(newState){
    _activeState = newState;
    notifyListeners();
  }

  void change_screen(widget){
    _current_screen = widget;
    notifyListeners();
  }
}