// ignore_for_file: prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthservice {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signupwithemailandpassword(
      String Email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: Email, password: password);
      return credential.user;
    } catch (e) {
      print('Some erroe occoured');
    }
    return null;
  }

  // Future<User?> signinwithemailandpassword(
  //     String Email, String password) async {
  //   try {
  //     UserCredential credential = await _auth.signInWithEmailAndPassword(
  //         email: Email, password: password);
  //     return credential.user;
  //   } catch (e) {
  //     print('Some erroe occoured');
  //   }
  //   return null;
  // }
}
