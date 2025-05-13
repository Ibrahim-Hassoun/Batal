import 'package:flutter/material.dart';
import '../remote/server.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _hasAccount = false;
  bool get hasAccount => _hasAccount;
  bool get isLoggedIn => _isLoggedIn;

 String? _access_token; 
String? get access_token => _access_token;

  void toggleHasAccount() {
    _hasAccount = !_hasAccount;
    notifyListeners();
  }

  void login(data) async {
  final response = await ApiServices.request(
    endpoint: '/api/v0.1/login',
    method: 'POST',
    body: data,
  );

  if (response['success']) {
    _isLoggedIn = true;
   _access_token = response['data']['data']['token'];
   ApiServices.access_token=response['data']['data']['token'];
    print('User Data: ${response['data']}');
    print('token is: $_access_token');
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
