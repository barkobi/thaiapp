import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thaiapp/state_managment/chat_state.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({super.key});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final _controller = TextEditingController();
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        onChanged: (val) {
          if (isEmpty != val.isEmpty) setState(() => isEmpty = val.isEmpty);
        },
        onSubmitted: (value) {
          Provider.of<ChatState>(context, listen: false).sendMessage(value);
          _controller.clear();
          setState(() {});
        },
        controller: _controller,
        style: TextStyle(color: Colors.grey[300]),
        decoration: InputDecoration(
          hintText: 'Enter your massage here...',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isEmpty ? Colors.grey : const Color(0xFFB3E5FC),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          suffixIcon: Container(
            width: 80,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: isEmpty
                  ? Colors.grey.withOpacity(0.2)
                  : Colors.lightBlue[100],
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(Icons.send_rounded),
          ),
          suffixIconColor: isEmpty ? Colors.grey : Colors.blueAccent,
        ),
      ),
    );
  }
}
