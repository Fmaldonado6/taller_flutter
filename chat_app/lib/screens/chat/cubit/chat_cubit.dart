import 'dart:async';

import 'package:chat_app/models/models.dart';
import 'package:chat_app/screens/chat/cubit/chat_states.dart';
import 'package:chat_app/screens/chat_list/cubit/chat_state.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ChatCubit extends Cubit<ChatState> {
  ChatService chatService;

  StreamSubscription<WebSocketMessage> messageSubscription;
  final List<Message> messages = List<Message>();
  String chatId;
  String username;
  ChatCubit(this.chatService) : super(ChatLoadingState());

  init(String chatId) {
    this.chatId = chatId;
    this.username = AuthService.username;
    this.messageSubscription = this.chatService.message.stream.listen((val) {
      print(val);
      this.messages.add(val.content);
    });
  }

  Future getMessages() async {
    try {
      final chat = await this.chatService.getChat(this.chatId);
      this.messages.addAll(chat.messages);
      emit(ChatLoadedState(chat.messages));
    } catch (e) {
      emit(ChatErrorState());
    }
  }

  sendMessage(String content) {
    final message = Message(
      chatId: chatId,
      content: content,
      username: username,
    );

    final webSocketmessage = WebSocketMessage(
      type: WebSocketMessageType.message.index,
      content: message,
    );

    this.chatService.sendMessage(webSocketmessage);
  }

  dipose() {
    this.messageSubscription.cancel();
  }
}
