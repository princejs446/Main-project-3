import 'package:flutter/material.dart';
import 'package:mainproject_3/Homescreen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  ResultScreen({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage score
    double percentage = (score / total) * 100;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // CircularProgressIndicator with percentage
            Stack(
              alignment: Alignment.center,
              children: [
                // Make the circular progress indicator bigger
                SizedBox(
                  width: 200,  // Adjust the width to make the indicator larger
                  height: 200, // Adjust the height to make the indicator larger
                  child: CircularProgressIndicator(
                    value: percentage / 100, // Set the value to the percentage
                    strokeWidth: 20, // Increased the stroke width to make it more prominent
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                Text(
                  '${percentage.toStringAsFixed(1)}%', // Display the percentage with one decimal place
                  style: TextStyle(
                    fontSize: 50, // Font size for the percentage text
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Display the score
            Text(
              'Score: $score / $total',
              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),

            // Restart button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
