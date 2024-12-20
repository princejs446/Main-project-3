import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mainproject_3/firebase_options.dart';
import 'package:mainproject_3/signup.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}