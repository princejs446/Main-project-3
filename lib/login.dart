import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mainproject_3/Homescreen.dart';
import 'package:mainproject_3/forgot_pass.dart';
import 'package:mainproject_3/signup.dart';  // Assuming you have a SignUpPage

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
      print('User signed in');
    } catch (e) {
      print('Sign-in error: $e');
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
      appBar: AppBar(title: Text('Log In',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),backgroundColor: Colors.lightBlue,) ,
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/signup.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 40,
            width: 300,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
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
                  labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
            ),
          ),
          SizedBox(height: 55),
          SizedBox(
            height: 40,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 84, 204, 252),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                _signIn();
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Log in', style: TextStyle(fontSize: 18)),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(fontSize: 18, color: Colors.blue),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signup())); // Assuming you have SignUpPage
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
