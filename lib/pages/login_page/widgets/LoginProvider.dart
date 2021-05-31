import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{
  bool _isLogged = false;
  String _currentEmail = "";

  bool isLoggedIn() => _isLogged;
  String currentEmail() => _currentEmail;

  void login(String email){
    _isLogged = true;
    _currentEmail = email;
    notifyListeners();
  }

  void logout(){
    _isLogged = false;
    notifyListeners();
  }

}