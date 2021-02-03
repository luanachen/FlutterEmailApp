import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/ContactsManager.dart';
import 'package:emailapp/ContactSearchDelegate.dart';
import 'package:flutter/material.dart';

import 'Contact.dart';
import 'ContactListBuilder.dart';

class ContactScreen extends StatelessWidget {
  ContactsManager manager = ContactsManager();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: [
            StreamBuilder<Object>(
                stream: manager.contactCount,
                builder: (context, snapshot) {
                  return Chip(label: Text((snapshot.data ?? 0).toString()));
                }),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: ContactSearchDelegate(manager: manager));
                }),
            Padding(padding: EdgeInsets.only(right: 16))
          ],
        ),
        drawer: AppDrawer(),
        body: ContactListBuilder(
            stream: manager.contactListView,
            builder: (context, contacts) {
              return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    Contact _contact = contacts[index];
                    return ListTile(
                      title: Text(_contact.name),
                      subtitle: Text(_contact.email),
                      leading: CircleAvatar(),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: contacts?.length ?? 0);
            }),
      ),
    );
  }
}
