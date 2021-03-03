// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat()
    ..id = json['id'] as String
    ..messages = (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'id': instance.id,
      'messages': instance.messages,
    };

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as String,
    chatId: json['chatId'] as String,
    username: json['username'] as String,
    content: json['content'] as String,
    dateSent: json['dateSent'] == null
        ? null
        : DateTime.parse(json['dateSent'] as String),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'chatId': instance.chatId,
      'username': instance.username,
      'content': instance.content,
      'dateSent': instance.dateSent?.toIso8601String(),
    };

WebSocketMessage _$WebSocketMessageFromJson(Map<String, dynamic> json) {
  return WebSocketMessage(
    type: json['type'] as int,
    content: json['content'] == null
        ? null
        : Message.fromJson(json['content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WebSocketMessageToJson(WebSocketMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'content': instance.content,
    };
