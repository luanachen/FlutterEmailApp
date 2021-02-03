import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  final String subject;
  final String message;

  MessageDetail(this.subject, this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subject)),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Text(message),
      ),
    );
  }
}
