import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _hasAccount = false;
  bool get hasAccount => _hasAccount;
  bool get isLoggedIn => _isLoggedIn;

  void toggleHasAccount() {
    _hasAccount = !_hasAccount;
    notifyListeners();
  }

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
