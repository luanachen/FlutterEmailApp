import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calendar")),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Calendar"),
      ),
    );
  }
}
