import 'package:firebaseappdio/models/text_model.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final bool myMessage;
  final TextModel textModel;

  const ChatWidget(
      {super.key, required this.myMessage, required this.textModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: myMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        color: myMessage ? Colors.lightGreen.shade100 : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!myMessage)
                Text(
                  textModel.nickname,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 16),
                ),
              Text(
                textModel.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
