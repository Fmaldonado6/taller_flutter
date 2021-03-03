import 'package:chat_app/models/models.dart';

abstract class ChatState {}

class ChatLoadingState extends ChatState {}

class ChatLoadedState extends ChatState {
  final List<Message> messages;
  ChatLoadedState(this.messages);
}

class ChatErrorState extends ChatState {}

class ChatNewMessageState extends ChatState {
  final List<Message> messages;
  ChatNewMessageState(this.messages);
}
