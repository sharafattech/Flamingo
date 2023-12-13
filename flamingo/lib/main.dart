// ignore_for_file: prefer_const_constructors

import 'package:flamingo/authantication/log_in_page.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyA_E8KUxWeckH2oxF2mGe67lQRG0KoE6x4',
          appId: '1:88981293537:android:967a3916085c940f8c6aa0',
          messagingSenderId: '88981293537',
          projectId: 'flamingo-852d4'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    );
  }
}
