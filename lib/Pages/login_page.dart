import 'package:flutter/material.dart';
import 'package:flutter_text_chat_appilication/components/button.dart';
import 'package:flutter_text_chat_appilication/components/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo placeSizedBox(
                const SizedBox(
                  height: 20,
                ),

                const Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.blueGrey,
                ),
                const SizedBox(
                  height: 20,
                ),
                // welcome text
                const Text(
                  "Welcome to Chat App",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obsureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obsureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                //signin button
                MyButton(
                  text: "Sign In",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                //not logged in ? Register Here!
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't hava an Account?",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Register Here",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
