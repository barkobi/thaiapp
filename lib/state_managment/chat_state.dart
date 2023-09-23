import 'package:flutter/material.dart';
import 'package:thaiapp/models/chat_model.dart';
import 'package:thaiapp/models/message.dart';

class ChatState extends ChangeNotifier {
  final ChatModel? _chat;

  ChatState() : _chat = ChatModel();

  ChatModel? get chat => _chat;

  Future<void> sendMessage(String content) async {
    final message = Message(
      content: content,
      time: DateTime.now(),
      isMe: true,
    );
    // TODO remove
    final message2 = Message(
      content: content,
      time: DateTime.now(),
      isMe: false,
    );

    _chat!.messages = [..._chat!.messages, message];
    notifyListeners();
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) {
      _chat!.messages = [..._chat!.messages, message2];
      notifyListeners();
    });
    try {
      // await ChatDB().sendMessage(sender.gangId, _message);
    } catch (e) {
      // print(e);
    }
  }
}
