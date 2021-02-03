import 'dart:async';

import 'package:emailapp/service/ContactService.dart';
import 'Contact.dart';

class ContactsManager {
  final StreamController<int> _contactCount = StreamController<int>();
  Stream<int> get contactCount => _contactCount.stream;

  Stream<List<Contact>> get contactListView =>
      Stream.fromFuture(ContactService.browse());

  Stream<List<Contact>> filteredCollection({query}) =>
      Stream.fromFuture(ContactService.browse(query: query));

  ContactsManager() {
    contactListView.listen((list) => _contactCount.add(list.length));
  }
}
