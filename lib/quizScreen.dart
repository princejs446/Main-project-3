import 'package:flutter/material.dart';
import 'package:mainproject_3/resultScreen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedOption; // Stores selected option for the current question

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is Flutter?',
      'options': ['A programming language', 'A framework', 'A database', 'An OS'],
      'answer': 1,
    },
    {
      'question': 'Who developed Flutter?',
      'options': ['Facebook', 'Microsoft', 'Google', 'Apple'],
      'answer': 2,
    },
    {
      'question': 'What language does Flutter use?',
      'options': ['Java', 'Dart', 'Kotlin', 'Swift'],
      'answer': 1,
    },
    {
      'question': 'Which widget is used to create a flexible layout?',
      'options': ['Container', 'Flexible', 'Column', 'Stack'],
      'answer': 1,
    },
    {
      'question': 'What is the role of a Scaffold widget?',
      'options': ['State management', 'Provides app structure', 'Navigation', 'Animation'],
      'answer': 1,
    },
    {
      'question': 'What does the hot reload feature do?',
      'options': [
        'Restart the app',
        'Update code without losing state',
        'Clear app cache',
        'Debug the app'
      ],
      'answer': 1,
    },
    {
      'question': 'What file manages app dependencies in Flutter?',
      'options': ['pubspec.yaml', 'main.dart', 'index.html', 'config.json'],
      'answer': 0,
    },
    {
      'question': 'What is a State in Flutter?',
      'options': [
        'Manages app data that changes over time',
        'Defines app routes',
        'Describes app UI',
        'Handles animations'
      ],
      'answer': 0,
    },
    {
      'question': 'What is the purpose of the main() function in Flutter?',
      'options': [
        'Runs the app',
        'Compiles the code',
        'Initializes database',
        'Connects to APIs'
      ],
      'answer': 0,
    },
    {
      'question': 'Which widget is used to navigate between screens?',
      'options': ['Navigator', 'Scaffold', 'AppBar', 'Container'],
      'answer': 0,
    },
  ];

  // Handles when an option is selected
  void _selectOption(int selectedOption) {
    setState(() {
      _selectedOption = selectedOption;
    });
  }

  // Handles the next button or finish button logic
  void _nextQuestion() {
    if (_selectedOption == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }

    setState(() {
      _currentQuestionIndex++;
      _selectedOption = null; // Reset the selected option for the next question
    });

    // Check if it's the last question to show the result screen
    if (_currentQuestionIndex == _questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: _score, total: _questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLastQuestion = _currentQuestionIndex == _questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Quiz'),
        backgroundColor: const Color.fromARGB(255, 216, 45, 82),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display the question
            Text(
              _questions[_currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Display options
            ..._questions[_currentQuestionIndex]['options']
                .asMap()
                .entries
                .map(
                  (entry) {
                    int index = entry.key;
                    String option = entry.value;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedOption == index
                              ? Colors.blue
                              : Colors.grey.shade300,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () => _selectOption(index),
                        child: Text(option),
                      ),
                    );
                  },
                )
                .toList(),

            SizedBox(height: 40),

            // Display Next or Finish button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: _selectedOption == null ? null : _nextQuestion,
              child: Text(isLastQuestion ? 'Finish' : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}
