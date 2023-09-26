import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thaiapp/screens/home/local_widgets/chat.dart';
import 'package:thaiapp/screens/home/local_widgets/drawer.dart';
import 'package:thaiapp/state_managment/chat_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const ThaiDrawer(),
          ChangeNotifierProvider<ChatState>(
            create: (context) => ChatState(),
            lazy: false,
            child: Chat(),
          ),
        ],
      ),
    );
  }
}
