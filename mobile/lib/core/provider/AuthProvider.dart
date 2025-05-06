import 'package:flutter/material.dart';
import '../remote/server.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _hasAccount = false;
  bool get hasAccount => _hasAccount;
  bool get isLoggedIn => _isLoggedIn;

  void toggleHasAccount() {
    _hasAccount = !_hasAccount;
    notifyListeners();
  }

  void login(data) async {
    print("Data sent: $data");
    final response = await request(
    endpoint: '/api/v0.1/login',
    method: 'POST',
    body: data
  );
  
  if (response['success']) {
    _isLoggedIn = true;
    print('User Data: ${response['data']}');
  } else {
    print('Error: ${response['message']}');
  }
    
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
