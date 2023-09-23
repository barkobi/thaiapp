import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:intl/intl.dart';
import 'package:thaiapp/models/message.dart';
import 'dart:math';

import 'package:thaiapp/widgets/floating_widget.dart';

class ChatBubble extends StatefulWidget {
  final Message message;

  const ChatBubble(this.message, {super.key});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  bool doneAnimate = false;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return FloatingWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: widget.message.isMe!
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.message.isMe!)
              CircleAvatar(
                radius: min(_size.height * 0.05, 30),
                backgroundColor: widget.message.isMe!
                    ? Colors.amber.withOpacity(0.8)
                    : Colors.amber.withOpacity(0.5),
              ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              margin: const EdgeInsets.only(
                right: 10,
                left: 10,
              ),
              constraints: BoxConstraints(
                maxWidth: _size.width * 0.6,
              ),
              decoration: BoxDecoration(
                color: widget.message.isMe!
                    ? Colors.amber.withOpacity(0.8)
                    : Colors.amber.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.message.isMe! ? 0 : 25),
                  topRight: Radius.circular(!widget.message.isMe! ? 0 : 25),
                  bottomLeft: const Radius.circular(25),
                  bottomRight: const Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.message.isMe! || doneAnimate
                      ? SelectableText(
                          widget.message.content!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        )
                      : AnimatedTextKit(
                          onFinished: () => setState(() => doneAnimate = true),
                          animatedTexts: [
                            TyperAnimatedText(
                              widget.message.content!,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                              speed: const Duration(milliseconds: 50),
                            ),
                          ],
                          totalRepeatCount: 1,
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat.Hm().format(widget.message.timeStamp!),
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            if (!widget.message.isMe!)
              CircleAvatar(
                radius: min(_size.height * 0.05, 30),
                backgroundColor: widget.message.isMe!
                    ? Colors.amber.withOpacity(0.8)
                    : Colors.amber.withOpacity(0.5),
              ),
          ],
        ),
      ),
    );
  }
}
