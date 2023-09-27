import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thaiapp/screens/home/local_widgets/chat_bubble.dart';
import 'package:thaiapp/screens/home/local_widgets/chat_input_bar.dart';
import 'package:thaiapp/state_managment/chat_state.dart';

class Chat extends StatefulWidget {
  Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ScrollController _controller = ScrollController();

  @override
  void didChangeDependencies() {
    if (_controller.hasClients) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = Provider.of<ChatState>(context);

    return Expanded(
      child: Container(
        color: const Color.fromRGBO(30, 30, 30, 1),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: chatState.chat!.messages.length,
                itemBuilder: (context, index) =>
                    ChatBubble(chatState.chat!.messages[index]),
              ),
            ),
            const ChatInputBar(),
          ],
        ),
      ),
    );
  }
}
