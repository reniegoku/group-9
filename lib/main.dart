import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universidad De Manila',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false, // Remove debug ribbon
      routes: {
        '/news': (context) => NewsPage(),
        '/calendar': (context) => CalendarPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => MainMenu(),
        '/settings': (context) => Settings(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainMenu()));
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

class ChatFloatingButton extends StatefulWidget {
  @override
  _ChatFloatingButtonState createState() => _ChatFloatingButtonState();
}

class _ChatFloatingButtonState extends State<ChatFloatingButton> {
  bool _isChatBoxVisible = false;
  double _buttonSize = 56.0;

  void _toggleChatBox() {
    setState(() {
      _isChatBoxVisible = !_isChatBoxVisible;
      _buttonSize = _isChatBoxVisible ? 450 : 56.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Add the floating action button here
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: _buttonSize,
          height: _buttonSize,
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
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.chat),
            onPressed: _toggleChatBox,
          ),
        ),
        // Add the small chat box here
        if (_isChatBoxVisible)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 450,
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 1,
                    spreadRadius: 0.5,
                    offset: Offset(0.0, 2.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Chat'),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to go back to the previous state here
                      _toggleChatBox();
                    },
                    child: Text('Back'),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 10),
            Text(
              'Universidad de Manila',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[700],
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          Center(
            child: Text(
              'Main Menu Page',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: ChatFloatingButton(),
          ),
        ],
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 10),
            Text(
              'Announcements',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[700],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Table(
            defaultColumnWidth: FixedColumnWidth(150),
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(
                children: [
                  Text('Column 1'),
                  Text('Column 2'),
                ],
              ),
              TableRow(
                children: [
                  Text('Row 1'),
                  Text('Row 2'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 10),
            Text(
              'Announcements',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[700],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Table(
            defaultColumnWidth: FixedColumnWidth(150),
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(
                children: [
                  Text('Column 1'),
                  Text('Column 2'),
                ],
              ),
              TableRow(
                children: [
                  Text('Row 1'),
                  Text('Row 2'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 10),
            Text(
              'Setting',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Segoe UI',
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[700],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Table(
            defaultColumnWidth: FixedColumnWidth(150),
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(
                children: [
                  Text('Column 1'),
                  Text('Column 2'),
                ],
              ),
              TableRow(
                children: [
                  Text('Row 1'),
                  Text('Row 2'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.transparent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Text(
                'Dashboard Menu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainMenu()));
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('News'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => NewsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Calendar'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CalendarPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log out'),
              onTap: () {
                // Show confirmation dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Confirm log out'),
                      content: Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Yes'),
                          onPressed: () {
                            // Close Dialog and remove option for back
                            Navigator.of(context).pop();
                            //Navigate to login page
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
