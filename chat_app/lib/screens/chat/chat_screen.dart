import 'package:chat_app/injection_container.dart';
import 'package:chat_app/models/models.dart';
import 'package:chat_app/screens/chat/components/chat_loaded.dart';
import 'package:chat_app/screens/chat/cubit/chat_cubit.dart';
import 'package:chat_app/screens/chat/cubit/chat_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;
  final String chatName;
  ChatScreen({
    Key key,
    @required this.chat,
    @required this.chatName,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatCubit = getIt.get<ChatCubit>();
  List<Message> messages = List<Message>();

  @override
  void initState() {
    super.initState();
    this.chatCubit.init(widget.chat.id);
    this.chatCubit.getMessages();
  }

  @override
  void dispose() {
    this.chatCubit.dipose();
    this.chatCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatName),
        centerTitle: true,
      ),
      body: BlocBuilder(
        cubit: chatCubit,
        builder: (context, state) {
          if (state is ChatLoadingState)
            return Center(
              child: CircularProgressIndicator(),
            );

          if (state is ChatLoadedState || state is ChatNewMessageState)
            this.messages = state.messages;

          return ChatLoaded(
            messages: this.messages,
          );
        },
      ),
    );
  }
}
