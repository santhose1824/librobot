import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  TextEditingController _messageController = TextEditingController();
  late String rollNo;
  List<ChatMessage> chatMessages = [];

  @override
  void initState() {
    super.initState();
    _getUserData(); // Call _getUserData when the screen initializes
  }

  Future<void> sendMessage(String rollNo, String message) async {
  // Add the user's message to the chatMessages list
  setState(() {
    chatMessages.add(ChatMessage(message, true)); // true indicates it's a user message
  });

  final response = await http.post(
    Uri.parse('http://65.0.251.150/chat'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'roll_no': rollNo,
      'query': message,
    }),
  );

  if (response.statusCode == 200) {
    // Parse the JSON response
    final Map<String, dynamic> data = jsonDecode(response.body);
    // Check if 'response' key exists and it's not null
    if (data.containsKey('response') && data['response'] != null) {
        setState(() {
            chatMessages.add(ChatMessage(data['response'].toString(), false));
        });
    } else {
        print('Response is not in the expected format');
    }
} else {
    // Handle other status codes
}
 }




  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rollNo = prefs.getString('roll_no') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                reverse: true, // Reverse the list to show new messages at the bottom
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(chatMessages[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _messageController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Type your message...',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.send),
                                onPressed: () {
                                  String message = _messageController.text;
                                  // Ensure rollNo is not null before calling sendMessage
                                  if (rollNo.isNotEmpty) {
                                    sendMessage(rollNo, message);
                                  } else {
                                    print('Roll number is not initialized');
                                  }
                                  // Clear the text field
                                  _messageController.clear();
                                },
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage(this.text, this.isUser);
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  ChatBubble(this.message);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: message.isUser ? Colors.black : Colors.white,
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUser ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
