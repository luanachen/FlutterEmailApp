import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Contact.dart';

class ContactService {
  static String _url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<Contact>> browse({query}) async {
    http.Response response = await http.get(_url);

    await Future.delayed(Duration(seconds: 3));

    String content = response.body;
    List collection = json.decode(content);

    Iterable<Contact> _contacts =
        collection.map((json) => Contact.fromJson(json));

    if (query != null && query.isNotEmpty) {
      _contacts = _contacts
          .where((contact) => contact.name.toLowerCase().contains(query));
    }

    return _contacts.toList();
  }
}
