import 'package:flutter/widgets.dart';

class BottomNavbarProvider with ChangeNotifier{
  String _activeState='feed';
  String get activeState=>_activeState;

  void changeState(newState){
    _activeState = newState;
    notifyListeners();
  }

}