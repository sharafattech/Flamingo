// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter Homepage'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Welcome to Homepage',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
