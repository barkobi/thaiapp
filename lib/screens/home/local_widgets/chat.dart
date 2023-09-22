import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thaiapp/screens/home/local_widgets/chat_bubble.dart';
import 'package:thaiapp/screens/home/local_widgets/chat_input_bar.dart';
import 'package:thaiapp/state_managment/chat_state.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final chatState = Provider.of<ChatState>(context);
    print(chatState.chat!.messages!.length);

    return Expanded(
      child: Container(
        color: const Color.fromRGBO(30, 30, 30, 1),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatState.chat!.messages!.length,
                itemBuilder: (context, index) =>
                    ChatBubble(chatState.chat!.messages![index]),
              ),
            ),
            ChatInputBar(),
          ],
        ),
      ),
    );
  }
}
