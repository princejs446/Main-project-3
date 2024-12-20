import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mainproject_3/forgot_pass.dart';
import 'package:mainproject_3/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

   Future<void> _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print('User signed up');
    } catch (e) {
      print('Sign-up error: $e');
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
      body: Column(
        children: [
          Container(
            height:400,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/signup.jpg"),fit: BoxFit.cover)
            ),
          ),
           SizedBox(height:20),

           SizedBox(
            height:40,
            width:300,
             child: TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
              ),
           ),
           SizedBox(height:20),
            SizedBox(
              height:40,
            width:300,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))
              ),
            ),
            SizedBox(height: 55),
            SizedBox(
              height:40,
              width:300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 153, 234, 245),foregroundColor: Colors.white),

                onPressed: (){
                  _signUp();
                  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => LoginPage())
);
                },
                child: Text('Sign Up',style:TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Already have an Account?",style: TextStyle(color:Colors.black,fontSize: 18),),
              SizedBox(width:10),
              GestureDetector(
                onTap:(){
                 Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => LoginPage())
);

                } ,
                child: Text("Login",style: TextStyle(color:const Color.fromARGB(255, 136, 198, 248),fontSize: 18),))
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                },
                child: Text("Forgot password?",style: TextStyle(fontSize: 18,color:Colors.blue),)),
            ],)
           
        ],
      ),
    );
  }
}