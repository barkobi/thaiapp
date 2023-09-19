import 'package:flutter/material.dart';
import 'package:thaiapp/screens/home/local_widgets/chat_input_bar.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromRGBO(30, 30, 30, 1),
        child: const Column(children: [
          Expanded(
            child: Placeholder(),
          ),
          ChatInputBar(),
        ]),
      ),
    );
  }
}
