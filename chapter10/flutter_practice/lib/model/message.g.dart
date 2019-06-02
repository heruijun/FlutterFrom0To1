// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
      name: json['name'] as String,
      head: json['head'] as String,
      message: json['message'] as String,
      time: json['time'] as String,
      type: json['type'] as String);
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'name': instance.name,
      'head': instance.head,
      'message': instance.message,
      'time': instance.time,
      'type': instance.type
    };
