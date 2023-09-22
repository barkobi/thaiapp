import 'package:flutter/material.dart';
import 'dart:convert';

class Message {
  String? content;
  bool? isMe;
  DateTime? timeStamp;

  Message({required this.content, required this.isMe, DateTime? time})
      : timeStamp = time ?? DateTime.now();

  Message.fromJSON(String jsonData) {
    final data = json.decode(jsonData);
    content = data['content'];
    isMe = data['isMe'];
    timeStamp = data['timeStamp'];
  }

  String toJson() {
    return json.encode({
      'content': content,
      'isMe': isMe,
      'timeStamp': timeStamp,
    });
  }
}
