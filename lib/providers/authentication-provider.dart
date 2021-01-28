import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _authenticated = false;

  bool get authenticated => _authenticated;

  void attempt({Map credentials}) {
    _authenticated = true;

    notifyListeners();
  }
}
