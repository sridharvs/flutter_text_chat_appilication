import 'package:flutter/material.dart';
import 'package:flutter_text_chat_appilication/components/button.dart';
import 'package:flutter_text_chat_appilication/components/text_field.dart';
import 'package:flutter_text_chat_appilication/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static TextEditingController confirmPaswordController =
      TextEditingController();

  //signup user.. method
  Future<void> signUp() async {
    if (passwordController.text != confirmPaswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password doesn't Match"),
        ),
      );
      return;
    }

    //get auth sevice
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpwithemailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
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
                  "Rigister here for account creation",
                  style: TextStyle(
                    fontSize: 20,
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
                //confirm password textfield
                MyTextField(
                  controller: confirmPaswordController,
                  hintText: "Confirm Password",
                  obsureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                //register button
                MyButton(
                  text: "Sign Up",
                  onTap: signUp,
                ),
                const SizedBox(
                  height: 15,
                ),
                //already logged in ? login Here!
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already hava an Account?",
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "LogIn Here",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
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
