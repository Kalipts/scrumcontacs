import 'package:flutter/material.dart';
import 'dart:math';
import 'package:srumcontacts/models/Contact.dart';
import 'package:srumcontacts/repository/repository_service_contact.dart';
import 'package:srumcontacts/repository/database_creator.dart';


void main() async {
  await DatabaseCreator().initDatabase();
  runApp(MyApp());
}

class MyApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqlLiteCrud(title: 'contact page'),
    );
  }

}

class SqlLiteCrud extends StatefulWidget{
  SqlLiteCrud({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SqlLiteCrudState createState() => _SqlLiteCrudState();
}

class _SqlLiteCrudState extends State<SqlLiteCrud>{
  final _fromkey = GlobalKey<FormState>();
  Future<List<Contact>> future;
  String name;
  String id;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    future = RepositoryServiceContact.getAllContact();
  }

  void readData() async {
    final contact = await RepositoryServiceContact.getContact(id);
    print(contact.name);
  }
}