import 'package:flutter/material.dart';
import 'package:thaiapp/screens/home/local_widgets/chat.dart';
import 'package:thaiapp/screens/home/local_widgets/drawer.dart';
import 'package:thaiapp/screens/home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          ThaiDrawer(),
          Chat(),
          //ThaiHomePage()
        ],
      ),
    );
  }
}
