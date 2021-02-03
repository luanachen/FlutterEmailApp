import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  static Future<List<Message>> browse({String status = "important"}) async {
    String url = status == "important"
        ? 'https://run.mocky.io/v3/e7b3c3e7-1f2d-4045-a4c2-c94710bf4958'
        : 'https://run.mocky.io/v3/6e6e1dbe-b653-4f5a-8039-7c367e643339';
    http.Response response = await http.get(url);

    await Future.delayed(Duration(seconds: 1));

    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}
