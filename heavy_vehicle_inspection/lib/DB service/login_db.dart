// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class LogInData extends GetxController {
  static final LogInData instance = LogInData();
  static Database? _database;
  LogInData();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initdatabase();
    return _database!;
  }

  Future<Database> _initdatabase() async {
    Directory data_directory = await getApplicationDocumentsDirectory();
    print('DB Location:' + data_directory.path);
    final String path = join(await getDatabasesPath(), 'login_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _CreateDatabase,
    );
  }

  Future<void> _CreateDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE login_table (
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        phonenumber TEXT,
        specialist TEXT,
        location TEXT
      )
    ''');
  }

  Future<int> insertlogindetail(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('login_table', row);
  }

  Future<List<Map<String, dynamic>>> getalllogindetails() async {
    Database db = await instance.database;
    return await db.query('login_table');
  }

  Future<int> updatelogindetails(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update('login_table', row, where: 'id=?', whereArgs: [id]);
  }

  Future<int> deletelogindetails(int id) async {
    Database db = await instance.database;

    return await db.delete('login_table', where: 'id=?', whereArgs: [id]);
  }
}
