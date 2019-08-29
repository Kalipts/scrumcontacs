

import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';




Database db;

class DatabaseCreator {
  static const contactTable = 'contacts';
  static const id = 'id';
  static const name = 'name';
  static const email = 'email';
  static const address = 'address';
  static const contactImage = 'contactImage';



  Future<void> createContactTable(Database db)  async{
    final contactSql = '''
    
    CREATE TABLE $contactTable (
      $id INTEGER PRIMARY KEY,
      $name TEXT,
      $email TEXT,
      $address TEXT,
      $contactImage TEXT
   
    ) 
    ''';
    await db.execute(contactSql);
  }



  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists()) {
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }


  Future<void> initDatabase() async {
    final path = await getDatabasePath('contact_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createContactTable(db);
  }


}