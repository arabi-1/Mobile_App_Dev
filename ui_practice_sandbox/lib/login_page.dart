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
            SizedBox(height: 30),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                minRadius: 40,
                maxRadius: 70,
                child: Icon(Icons.person_2_sharp, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(minimumSize: Size(350, 50)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'Login in with Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(right: 1),
                        child: Icon(Icons.mail, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(minimumSize: Size(350, 50)),
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Text(
                      "Login with Google",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(right: 1),
                        child: Icon(
                          Icons.g_mobiledata_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(minimumSize: Size(350, 50)),
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Text(
                      "Login with Apple",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Padding(
                        padding: const EdgeInsetsGeometry.only(right: 1),
                        child: Icon(Icons.apple, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(minimumSize: Size(350, 50)),
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Text(
                      'Login with Facebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 1),
                        child: Icon(Icons.facebook, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
