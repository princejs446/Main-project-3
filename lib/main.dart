import 'package:flutter/material.dart';
import 'package:mainproject_3/Homescreen.dart';
import 'package:mainproject_3/signup.dart';


void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}