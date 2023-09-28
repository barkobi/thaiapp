import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thaiapp/services/auth_service.dart';
import 'package:thaiapp/widgets/my_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:thaiapp/widgets/signInButton.dart';
import 'package:thaiapp/widgets/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  final Function()? onGuestTap;
  const RegisterPage(
      {super.key, required this.onTap, required this.onGuestTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPassController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (confirmPassController.text == passwordController.text &&
          userNameController.text.isNotEmpty) {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // Send email verification
        await credential.user!.sendEmailVerification();
        addUser(credential.user!.email.toString(), credential.user!.uid,
            userNameController.text);
      } else {
        Navigator.of(context).pop();
        if (userNameController.text.isEmpty) {
          wrongShowMessage("Provide UserName");
        } else {
          wrongShowMessage("Passwords dont match");
        }
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      wrongShowMessage(e.code);
    }
  }

  void wrongShowMessage(String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Text(
            msg,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  Future<void> addUser(String email, String uid, String name) async {
    const serverUrl =
        'http://127.0.0.1:5000'; // Replace with your server's IP address
    final response = await http.post(
      Uri.parse('$serverUrl/add_user'),
      body: json.encode({'email': email, 'uid': uid}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('user added successfully');
    } else {
      print('Failed to add user. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                const Icon(Icons.lock, size: 50),
                const SizedBox(height: 25),
                Text(
                  "Create an account",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: userNameController,
                  hintText: "User's Name",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: confirmPassController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyButton(
                  signText: "Sign Up",
                  onTap: signUp,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue as",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onGuestTap,
                      child: const Text(
                        "Guest",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Or Continue with",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      onTap: () => AuthServer().signInWithGoogle(),
                      imagePath: "assets/google.png",
                    ),
                    const SizedBox(width: 25),
                    SquareTile(
                      onTap: () {},
                      imagePath: "assets/apple.png",
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
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
