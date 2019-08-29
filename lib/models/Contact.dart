import 'package:srumcontacts/repository/database_creator.dart';

class Contact {
  String id;
  String name;
  String phone;
  String email;
  String address;
  String contactsImage;

  Contact(this.id, this.name, this.phone, this.email, this.address,
      this.contactsImage);

  Contact.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.id = json[DatabaseCreator.name];
    this.id = json[DatabaseCreator.email];
    this.id = json[DatabaseCreator.address];
    this.id = json[DatabaseCreator.contactImage];
  }
}