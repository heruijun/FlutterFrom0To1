import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()

class Message {
  String name;
  String head;
  String message;
  String time;
  String type;  // 'send', 'receive'

  Message({this.name, this.head, this.message, this.time, this.type});

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}