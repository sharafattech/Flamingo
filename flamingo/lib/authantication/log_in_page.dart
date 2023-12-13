// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flamingo/authantication/create_new_account_page.dart';
import 'package:flamingo/authantication/firebase_auth_implemantation.dart';
import 'package:flamingo/authantication/homepage.dart';
import 'package:flamingo/authantication/redirect_page.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final FirebaseAuthservice _auth = FirebaseAuthservice();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loginfail = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/Flamingo.png'),
                ),
                SizedBox(height: 16.0),
                // Wrap with SizedBox to allow flexible height on small screens
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                // Wrap with SizedBox to allow flexible height on small screens
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = true;
                            });
                          },
                          child: Icon(Icons.visibility)),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => create_account()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Create new account',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    bool isLoggedIn = await _signup();
                    emailController.clear();
                    passwordController.clear();
                    if (isLoggedIn) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => redirect()),
                      );
                    } else {
                      setState(() {
                        loginfail = true;
                      });
                    }
                  },
                  child: Text('Log In'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _signup() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      User? user = await _auth.signupwithemailandpassword(email, password);
      if (user != null) {
        print('User is successfully created');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homepage()));
        return true;
      } else {
        print('Some error happened');
        return false;
      }
    } catch (e) {
      print('Error during signup: $e');
      return false;
    }
  }
}
//  Future<bool> _signup() async {
//     String email = emailController.text;
//     String password = passwordController.text;
//     User? user = await _auth.signupwithemailandpassword(email, password);
//     if (user != null) {
//       print('User is successfully created');

//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => homepage()));
//     } else {
//       print('Some error happend');
//     }
//   }
