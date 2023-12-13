import 'package:firebase_auth/firebase_auth.dart';
import 'package:flamingo/authantication/homepage.dart';
import 'package:flamingo/authantication/log_in_page.dart';
import 'package:flutter/material.dart';

class redirect extends StatelessWidget {
  const redirect({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('Login successfull');
            return homepage();
          } else {
            print('user not log in');
            return LogIn();
          }
        });
  }
}
