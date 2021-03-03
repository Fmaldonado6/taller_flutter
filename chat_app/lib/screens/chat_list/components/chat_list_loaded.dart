import 'package:chat_app/models/models.dart';
import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatListLoaded extends StatelessWidget {
  final List<Chat> chats;

  const ChatListLoaded({Key key, @required this.chats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ChatScreen(
                chat: chats[index],
                chatName: "Chat $index",
              ),
            ),
          );
        },
        leading: CircleAvatar(
          child: Icon(
            Icons.chat,
            color: Colors.grey.shade800,
          ),
          backgroundColor: Colors.indigo.shade100,
        ),
        trailing: Icon(Icons.chevron_right),
        title: Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Text("Chat $index"),
        ),
      ),
    );
  }
}
