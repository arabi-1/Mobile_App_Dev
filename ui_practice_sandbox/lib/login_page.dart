import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log in M Arabi")),
      backgroundColor: Color(0xFF37474F),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              'Salam, Please Login!',
              style: TextStyle(
                color: Color(0xFFECEFF1),
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent[400],
                foregroundColor: Colors.black,
                minimumSize: Size(350, 50),
              ),
              child: Text('Login', style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(color: Colors.grey, thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('OR', style: TextStyle(color: Colors.grey)),
                  ),
                  const Expanded(
                    child: Divider(color: Colors.grey, thickness: 1),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(minimumSize: Size(350, 50)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.mail),
                  SizedBox(width: 10),
                  Text(
                    'Login with Email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Opacity(
                    opacity: 0.0, // Make it invisible
                    child: Icon(Icons.mail), // Same icon as left
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
