import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipe_app/services/auth_service.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    return StreamBuilder<User?>(
      stream: authService.userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          return const Center(
            child: Text('Home Screen - Hurray You are logged in!!'),
          );
        }
        return const Center(child: Text("Login Screen - Please Log in"));
      },
    );
  }
}
