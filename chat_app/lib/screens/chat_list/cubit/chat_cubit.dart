import 'package:chat_app/models/exceptions.dart';
import 'package:chat_app/screens/chat_list/cubit/chat_state.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ChatListCubit extends Cubit<ChatListState> {
  ChatService _chatService;

  ChatListCubit(this._chatService) : super(ChatListLoadingState());

  init(){
    this._chatService.connect();
  }

  Future getChats() async {
    emit(ChatListLoadingState());

    try {
      final chats = await this._chatService.getChats();
      print(chats);
      emit(ChatListLoadedState(chats));
    } on DioError catch (e) {
      print(e is Forbidden);
    } catch (e) {
      print(e);
    }
  }
}
