import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ChatBubble extends StatelessWidget {
  final String name;
  final String message;
  final bool isMe;

  const ChatBubble({super.key, required this.name, required this.message, required this.isMe});

  @override
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6.0),
        Padding(
          padding: EdgeInsets.only(left: deviceWidth * 0.01),
          child: Align(
            alignment: isMe ? Alignment.topRight : Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isMe ? 16.0 : 0),
                  topRight: Radius.circular(isMe ? 0 : 16.0),
                  bottomLeft: const Radius.circular(16.0),
                  bottomRight: const Radius.circular(16.0),
                ),
              ),
              child: isMe
                  ? Text(
                      message,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.white),
                    )
                  : AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          message,
                          textStyle: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                          speed: const Duration(milliseconds: 50),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
