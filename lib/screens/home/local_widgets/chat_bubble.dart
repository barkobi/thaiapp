import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:intl/intl.dart';
import 'package:thaiapp/models/message.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: EdgeInsets.only(
        right: message.isMe! ? _size.width * 0.3 : 10,
        left: !message.isMe! ? _size.width * 0.3 : 10,
        top: 10,
      ),
      constraints: BoxConstraints(minHeight: _size.height * 0.1),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(message.isMe! ? 0 : 25),
          topRight: Radius.circular(!message.isMe! ? 0 : 25),
          bottomLeft: const Radius.circular(25),
          bottomRight: const Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              message.content!,
              softWrap: true,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              DateFormat.Hm().format(message.timeStamp!),
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
