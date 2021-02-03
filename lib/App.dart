import 'package:emailapp/CalendarScreen.dart';
import 'package:emailapp/InboxScreen.dart';
import 'package:flutter/material.dart';

import 'contactScreen.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [InboxScreen(), ContactScreen(), CalendarScreen()]
          .elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: "Inbox", icon: Icon(Icons.mail)),
          BottomNavigationBarItem(label: "Contacts", icon: Icon(Icons.people)),
          BottomNavigationBarItem(
              label: "Calendar", icon: Icon(Icons.calendar_today))
        ],
        onTap: _onBarItemTap,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
