import 'package:flutter/material.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text("Practice Ui", style: TextStyle(color: Colors.white24)),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 8.0),
          OutlinedButton(
            style: OutlinedButton.styleFrom(minimumSize: Size(350, 50)),
            onPressed: () {},
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Text(
                  "Login with Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.password, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Divider(color: Colors.black, thickness: 1)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ORR",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Colors.black, thickness: 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
