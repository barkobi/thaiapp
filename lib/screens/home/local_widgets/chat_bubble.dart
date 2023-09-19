import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ChatBubble extends StatelessWidget {
  final String name;
  final String message;
  final bool isMe;

  const ChatBubble(
      {super.key,
      required this.name,
      required this.message,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container();
  }
}
