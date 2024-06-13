import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Grade extends StatefulWidget {
  @override
  _GradeState createState() => _GradeState();
}

class _GradeState extends State<Grade> {
  List<dynamic> _students = [];

  void _getStudents() async {
    // Send HTTP request to PHP script
    final response =
        await http.get(Uri.parse('https://localhost/get_students.php'));

    // Check response
    if (response.statusCode == 200) {
      // Decode JSON response
      final jsonData = jsonDecode(response.body);

      // Update the _students list
      setState(() {
        _students = jsonData;
      });
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
  void initState() {
    super.initState();
    _getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade'),
      ),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_students[index]['name']),
              subtitle: Text(_students[index]['grade']),
            ),
          );
        },
      ),
    );
  }
}
