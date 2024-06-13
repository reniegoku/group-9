import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Student Information'),
            onTap: () {
              // Navigate to Student Information screen
              Navigator.pushNamed(context, '/student_info');
            },
          ),
          ListTile(
            title: Text('Security and Privacy'),
            onTap: () {
              // Navigate to Security and Privacy screen
              Navigator.pushNamed(context, '/security_privacy');
            },
          ),
          ListTile(
            title: Text('Notification'),
            onTap: () {
              // Navigate to Notification screen
              Navigator.pushNamed(context, '/notification');
            },
          ),
          ListTile(
            title: Text('Themes'),
            onTap: () {
              // Navigate to Themes screen
              Navigator.pushNamed(context, '/themes');
            },
          ),
        ],
      ),
    );
  }
}
