import 'package:craftshubapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),

              // logo
               const Icon(
                Icons.lock,
                size: 100,
              ),
              
              const SizedBox(height: 50),
          
              // welcome message
              Text(
                'Welcome Back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),
          
              // username textfield
              MyTextField(),

              const SizedBox(height: 10),
          
              // password textfield
              MyTextField(),
          
              // forgot password
          
              // sign in button
          
              // or continue with
          
              // google + apple sign in buttons
          
              // not a member? register now 
            ],
          ),
        ),
      ),
    );
  }
}