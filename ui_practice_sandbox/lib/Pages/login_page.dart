import 'package:flutter/material.dart';

class login_screen extends StatelessWidget {
  const login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log In")),
      backgroundColor: Color(0xFF37474F),
    );
  }
}
