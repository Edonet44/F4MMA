import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bckg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: implement login with email and password
                  },
                  child: Text(
                    'Login with Email',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // TODO: implement login with Google
                  },
                  child: Text(
                    'Login with Google',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}