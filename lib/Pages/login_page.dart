import 'package:flutter/material.dart';
import 'package:flutter_text_chat_appilication/components/button.dart';
import 'package:flutter_text_chat_appilication/components/text_field.dart';
import 'package:flutter_text_chat_appilication/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static TextEditingController confirmPaswordController =
      TextEditingController();

  //user sighIn method
  void signIn() async {
    // this if statements is not working need to improve
    if (passwordController.text == confirmPaswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("entered Password Wrong"),
        ),
      );
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

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
                  onTap: signIn,
                ),
                const SizedBox(
                  height: 15,
                ),
                //not logged in ? Register Here!
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("not register?"),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
