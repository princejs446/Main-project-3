import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mainproject_3/Homescreen.dart';
import 'package:mainproject_3/forgot_pass.dart';
import 'package:mainproject_3/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // If successful, navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      // Show error dialog if sign-in fails
      _showErrorDialog(e.toString());
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log In',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
        
          Positioned.fill(
            child: Image.asset(
              'assets/images/log.jpeg', 
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 300,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(height: 55),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _signIn,
                  child: Text('Log in', style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(fontSize: 18, color:Colors.lightBlueAccent),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signup())); // Assuming you have SignUpPage
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.lightBlueAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
