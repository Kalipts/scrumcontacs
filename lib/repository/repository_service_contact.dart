

import 'package:srumcontacts/models/Contact.dart';
import 'package:srumcontacts/repository/database_creator.dart';

class RepositoryServiceContact {
  static Future<void> addContact(Contact contact) async {
    final sql = '''INSERT INTO ${DatabaseCreator.contactTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.email},
      ${DatabaseCreator.address},
      ${DatabaseCreator.contactImage},
    )
    VALUE(?,?,?,?,?)''';
    List<dynamic> params= [contact.id, contact.name, contact.email, contact.address, contact.contactsImage];
    final result = await db.rawInsert(sql, params);

  }

  static Future<List<Contact>> getAllContact() async {
    final sql = '''SELECT *FROM ${DatabaseCreator.contactTable}
  ''';
    final data = await db.rawQuery(sql);
    List<Contact> contacts = List();

    for (final node in data) {
      final contact = Contact.fromJson(node);
    }
  }

  static Future<Contact> getContact(String id) async {}
  final sql = '''SELECT * FROM ${DatabaseCreator.contactTable}
  WHERE ${DatabaseCreator.id} = ?''';

  List<dynamic> params = [id];
  final data = await db.rawQuery(sql, params);

  final contact = Contact.fromJson(data.first);
  return contact;
}