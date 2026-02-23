import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.login(email, password);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
