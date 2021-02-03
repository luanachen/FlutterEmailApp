import 'package:emailapp/message.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = "";
  String subject = "";
  String body = "";

  final key = GlobalKey<FormState>();

  ListTile createField(String labelText, String validate(String value),
      {int maxLine = 1}) {
    return ListTile(
      title: TextFormField(
        validator: (value) => validate(value),
        onSaved: (newValue) => body = newValue,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(fontWeight: FontWeight.bold)),
        maxLines: maxLine,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message compose"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              createField(
                  "TO",
                  (String value) => !value.contains("@")
                      ? "This field must have a valid email"
                      : null),
              createField("SUBJECT", (String value) {
                int len = value.length;
                if (len == 0) {
                  return "'SUBJECT' cannot be empty";
                } else if (len < 4) {
                  return "'SUBJECT' must be longer than 4 characters";
                }
                return null;
              }),
              createField("BODY", (String value) => null, maxLine: 9),
              ListTile(
                title: RaisedButton(
                  child: Text("SEND"),
                  onPressed: () {
                    if (this.key.currentState.validate()) {
                      this.key.currentState.save();
                      Message message = Message(subject, body);
                      Navigator.pop(context, message);
                    }
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
