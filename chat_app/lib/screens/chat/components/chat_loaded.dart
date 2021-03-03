import 'package:chat_app/models/models.dart';
import 'package:flutter/material.dart';

class ChatLoaded extends StatelessWidget {
  final List<Message> messages;

  const ChatLoaded({
    Key key,
    @required this.messages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(messages.length);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: this.messages.length,
            itemBuilder: (context, index) => Text(
              this.messages[index].content,
            ),
          ),
        )
      ],
    );
  }
}
