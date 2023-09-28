import 'package:flutter/material.dart';
import 'package:thaiapp/screens/home/home_screen.dart';
import 'package:thaiapp/screens/register_page.dart';
import 'package:thaiapp/screens/sign_screen.dart';

class LoginOrReg extends StatefulWidget {
  LoginOrReg({super.key, required this.showLoginPage});
  bool showLoginPage;

  @override
  State<LoginOrReg> createState() => _LoginOrRegState();
}

class _LoginOrRegState extends State<LoginOrReg> {
  bool guest = false;

  void togglePage() {
    setState(() {
      widget.showLoginPage = !widget.showLoginPage;
    });
  }

  void continueAsUser() {
    setState(() {
      guest = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (guest) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      });
      return SizedBox();
    }
    return widget.showLoginPage
        ? SignScreen(
            onTap: togglePage,
            onGuestTap: continueAsUser,
          )
        : RegisterPage(
            onTap: togglePage,
            onGuestTap: continueAsUser,
          );
  }
}
