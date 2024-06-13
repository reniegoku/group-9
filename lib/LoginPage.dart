import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    // Send HTTP request to PHP script
    final response = await http.post(
      Uri.parse('https://your-server.com/login.php'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': _usernameController.text,
        'password': _passwordController.text,
      },
    );

    // Check response
    if (response.statusCode == 200) {
      // Check if user exists
      if (response.body == 'success') {
        // User exists, navigate to main menu
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainMenu()),
        );
      } else {
        // User does not exist, show error message
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Invalid username or password'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      // Error occurred, show error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Unibersidad de Manila',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white, // Change the color to white
            fontFamily: 'Segoe UI', // Change the font to Segeo UI
            fontSize: 24, // Change the font size to 24
          ),
        )), // Center the title text
        backgroundColor: Colors.green[900],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.lightGreen[700],
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 1,
                spreadRadius: 0.5,
                offset: Offset(0.0, 2.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //username
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 1,
                          spreadRadius: 0.5,
                          offset: Offset(0.0, 2.0),
                        ),
                      ]),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //Password
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 1,
                          spreadRadius: 0.5,
                          offset: Offset(0.0, 2.0),
                        ),
                      ]),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Log In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
