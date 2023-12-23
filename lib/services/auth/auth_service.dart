import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  //instance of Auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //sign user in
  Future<UserCredential> signInWithEmailansPassword(
      String email, String password) async {
    try {
      //sigin
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    //this will catch if any error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //signout
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
