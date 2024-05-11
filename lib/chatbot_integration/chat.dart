import 'package:flutter/material.dart';
import '../app_styles.dart'; // Import your styling
import 'gpt.dart'; // Import your AI class

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late TextEditingController controller;
  late FocusNode focusNode;
  final List<Map<String, String>> messages = []; // List of messages with 'text' and 'type'
  String response = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat with Pulga",
          style: AppTextStyles.pageTitle.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message["type"] == "user"; // Check message type
                return Align(
                  alignment: isUser ? Alignment.centerLeft : Alignment.centerRight, // Align messages
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.lightGreen[100] : Colors.grey[300], // Differentiate colors
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "${isUser ? "User:" : "Pulga:"} ${message["text"] ?? ""}",
                      style: AppTextStyles.subtitle,
                    ),
                  ),
                );
              },
            ),
          ),
          _buildSearch(), // Input field to send new messages
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: const InputDecoration(
                hintText: "Chat with Pulga...",
                prefixIcon: Icon(Icons.chat, color: Colors.grey),
              ),
              onSubmitted: (String value) {
                if (value.isNotEmpty) {
                  _handleUserInput(value);
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                _handleUserInput(controller.text); // Send user input
              }
            },
          ),
        ],
      ),
    );
  }

  void _handleUserInput(String userInput) {
    setState(() {
      messages.add({"text": userInput, "type": "user"}); // Add user message
    });

    // Simulate AI response and add to messages list
    Future.delayed(Duration(seconds: 1), () async {
      final botResponse = await Response().askAi(userInput); // Get AI response
      setState(() {
        messages.add({"text": botResponse, "type": "bot"}); // Add bot response
      });
    });

    controller.clear(); // Clear input field
  }
}
