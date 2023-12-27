import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_chat_appilication/Pages/home_page.dart';
import 'package:flutter_text_chat_appilication/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            //user is logged in
            if (snapshot.hasData) {
              return HomePage();
            }
            //user not logged in
            else {
              return LoginOrRegister();
            }
          })),
    );
  }
}
