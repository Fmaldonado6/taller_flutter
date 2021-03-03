import 'package:chat_app/models/models.dart';

abstract class ChatListState {}

class ChatListLoadingState extends ChatListState {}

class ChatListLoadedState extends ChatListState {
  final List<Chat> chats;

  ChatListLoadedState(this.chats);
}

class ChatListErrorState extends ChatListState {
  final String error;

  ChatListErrorState(this.error);
}
