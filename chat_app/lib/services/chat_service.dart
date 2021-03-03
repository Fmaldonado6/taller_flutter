import 'dart:async';
import 'dart:convert';

import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/data_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/io.dart';

@Injectable()
class ChatService extends DataService {
  static String token;
  IOWebSocketChannel channel;
  ChatService(dio.Dio dio) : super(dio);
  StreamController connected = StreamController<bool>();
  StreamController<WebSocketMessage> message =
      StreamController<WebSocketMessage>();

  connect() async {
    if (this.channel != null) await this.channel.sink.close();

    this.channel = IOWebSocketChannel.connect(
      Uri.parse(this.baseUrlWs),
      pingInterval: Duration(seconds: 15),
    );

    channel.stream.listen(
      (msg) {
        this.parseMessage(msg as String);
      },
      onDone: this.socketClosed,
      onError: this.socketError,
    );
    this.connected.sink.add(true);
  }

  socketClosed() {
    print("Closed!");
    this.connected.sink.add(false);
  }

  socketError(e) {
    print("Error: $e");
    this.connected.sink.add(false);
  }

  parseMessage(String message) {
    final parsedMessage = WebSocketMessage.fromJson(jsonDecode(message));
    this.message.add(parsedMessage);
  }

  sendMessage(WebSocketMessage message) {
    this.channel.sink.add(jsonEncode(message));
  }

  Future<List<Chat>> getChats() async {
    dio.Response response = await this.dio.get("${this.baseUrl}/chat");

    final json = response.data as List<Object>;

    return json.map((e) => Chat.fromJson(e)).toList();
  }

  Future<Chat> getChat(String id) async {
    dio.Response response = await this.dio.get("${this.baseUrl}/chat/$id");

    return Chat.fromJson(response.data);
  }
}
