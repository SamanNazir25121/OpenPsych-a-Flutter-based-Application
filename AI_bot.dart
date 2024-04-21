// ignore_for_file: unnecessary_string_interpolations, camel_case_types, prefer_const_declarations, unnecessary_type_check, library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AI_bot extends StatefulWidget {
  const AI_bot({Key? key}) : super(key: key);

  @override
  _AI_botState createState() => _AI_botState();
}

class _AI_botState extends State<AI_bot> {
  final List<UserMessage> chatMessages = [];
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPEN PSYCH'),
      ),
      body:  Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color.fromARGB(255, 14, 111, 190), Color.fromARGB(255, 136, 185, 138)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  child: Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: chatMessages.length,
          itemBuilder: (context, index) {
            final message = chatMessages[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (message is UserMessage)
                    CircleAvatar(
                      backgroundImage: AssetImage(message.imageAssetPath),
                      radius: 20,
                    ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: message is UserMessage ? Colors.blue : Colors.green, // Use different colors for user and chatbot messages
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      Container(
        color: Colors.white, // Set the background color to white
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Feel Free to ask.....',
                ),
              onSubmitted: (message) => sendMessage(message, 'images/User.png'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => sendMessage(textController.text, 'images/User.png'), // Replace with the path to the user's picture
            ),
          ],
        ),
      ),
    ],
  ),
),
    );
  }
  void sendMessage(String message,String imageAssetPath) async {
  setState(() {

     chatMessages.add(UserMessage(message, imageAssetPath));
  });
  textController.clear();

  final apiUrl = 'https://api.openai.com/v1/chat/completions';
  final apiKey = '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'; // Replace with your GPT API key

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
    body: jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": message}, // Use the actual user input message here
      ]
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('API Response: $data');

    if (data != null && data['choices'] != null && data['choices'].isNotEmpty) {
      final chatResponse = data['choices'][0]['message']['content'];
      if (chatResponse != null) {
        setState(() {
          chatMessages.add(UserMessage(chatResponse, 'images/UserBot.png')); //
        });
      } else {
        print('No text found in API response.');
      }
    } else {
      print('Invalid API response format.');
    }
  } else {
    print('API request failed with status code: ${response.statusCode}');
  }
}

}

class UserMessage {
  final String text;
  final String imageAssetPath;

  UserMessage(this.text, this.imageAssetPath);
}
