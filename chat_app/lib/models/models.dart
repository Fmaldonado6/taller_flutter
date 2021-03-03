import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Chat {
  String id;
  List<Message> messages;

  Chat();

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}

@JsonSerializable()
class Message {
  String id;
  String chatId;
  String username;
  String content;
  DateTime dateSent;

  Message({
    this.id,
    this.chatId,
    this.username,
    this.content,
    this.dateSent,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class WebSocketMessage {
  int type;
  Message content;

  WebSocketMessage({this.type, this.content});
  factory WebSocketMessage.fromJson(Map<String, dynamic> json) =>
      _$WebSocketMessageFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketMessageToJson(this);
}

enum WebSocketMessageType { connected, disconnected, message }
