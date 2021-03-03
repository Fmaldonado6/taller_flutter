import 'package:chat_app/injection_container.dart';
import 'package:chat_app/screens/chat_list/components/chat_list_loaded.dart';
import 'package:chat_app/screens/chat_list/cubit/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/chat_cubit.dart';

class ChatList extends StatefulWidget {
  final String username;

  const ChatList({Key key, this.username}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final _chatListCubit = getIt.get<ChatListCubit>();

  @override
  void initState() {
    super.initState();
    this._chatListCubit.getChats();
  }

  @override
  void dispose() {
    this._chatListCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat List"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => _chatListCubit,
        child: BlocBuilder(
          cubit: _chatListCubit,
          builder: (context, state) {
            if (state is ChatListLoadingState)
              return Center(
                child: CircularProgressIndicator(),
              );

            if (state is ChatListLoadedState)
              return ChatListLoaded(
                chats: state.chats,
              );

            return Center(
              child: Text("Error"),
            );
          },
        ),
      ),
    );
  }
}
