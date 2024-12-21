import 'package:flutter/material.dart';
import 'package:mainproject_3/login.dart';
import 'package:mainproject_3/quizScreen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 149, 194, 231),
        title: Text('Home'),
        automaticallyImplyLeading: false, 
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
        
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
      
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/log.jpeg'), 
            fit: BoxFit.cover, 
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(50),
              backgroundColor:const Color.fromARGB(255, 149, 194, 231), 
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizScreen()),
              );
            },
            child: Text(
              "Start",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
