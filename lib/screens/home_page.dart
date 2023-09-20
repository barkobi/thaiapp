import 'package:flutter/material.dart';
import 'package:thaiapp/widgets/chat_bubble.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThaiHomePage extends StatefulWidget {
  const ThaiHomePage({super.key});

  @override
  State<ThaiHomePage> createState() => _ThaiHomePageState();
}

class _ThaiHomePageState extends State<ThaiHomePage> {
  final TextEditingController _searchController = TextEditingController();

  List<ChatBubble> chat = [
    const ChatBubble(
        name: "Thai",
        isMe: false,
        message:
            "Hi this the the Thai Bot here speaking, please enter any type of text you want to me to analayze, What is your name?")
  ];

  Future<void> addUser(String word) async {
    print("hsad");
    const serverUrl = 'workonit-back.azurewebsites.net';
    final response = await http.post(
      Uri.parse('$serverUrl/send_message'),
      body: json.encode({'username': word}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      chat.add(ChatBubble(name: "Thai", message: response.body, isMe: false));
      refreshChat();
    } else {
      print('Failed to add user. Status code: ${response.statusCode}');
    }
  }

  void refreshChat() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: deviceWidth * 0.7,
          height: deviceHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Scaffold(
            backgroundColor: Theme.of(context).hintColor,
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: chat.length,
                    itemBuilder: (context, index) => ChatBubble(
                        name: chat[index].name,
                        message: chat[index].message,
                        isMe: chat[index].isMe),
                  ),
                ),
                Container(
                  width: deviceWidth,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      ElevatedButton(
                        onPressed: () {
                          String message = _searchController.text;
                          chat.add(ChatBubble(
                              name: "Bar", message: message, isMe: true));
                          refreshChat();
                          addUser(message);
                        },
                        child: const Icon(Icons.send_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: deviceWidth * 0.2,
          color: Colors.black,
          height: deviceHeight,
          child: Scaffold(
            appBar: AppBar(title: const Text("Chats")),
          ),
        )
      ],
    );
  }
}
