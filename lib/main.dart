// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'student_info_screen.dart';
import 'to_to_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical 11 - Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/student_info': (context) => StudentInfoScreen(),
        '/to_do_list': (context) => ToDoListScreen(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practical 11'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/student_info');
              },
              child: Text('Question 1'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/to_do_list');
              },
              child: Text('Question 2'),
            ),
          ],
        ),
      ),
    );
  }
}
