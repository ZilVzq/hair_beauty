import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{
  bool _isLogged = false;

  bool isLoggedIn() => _isLogged;

  void login(){
    _isLogged = true;
    notifyListeners();
  }

  void logout(){
    _isLogged = false;
    notifyListeners();
  }

}