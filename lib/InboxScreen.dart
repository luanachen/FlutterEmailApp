import 'package:emailapp/AppDrawer.dart';
import 'package:flutter/material.dart';

import 'messageList.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Inbox"),
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: () async {})
          ],
          bottom: TabBar(
            tabs: [Tab(text: "Important"), Tab(text: "Other")],
          ),
        ),
        body: TabBarView(
          children: [
            MessageList(status: 'important'),
            MessageList(status: 'others')
          ],
        ),
      ),
    );
  }
}
