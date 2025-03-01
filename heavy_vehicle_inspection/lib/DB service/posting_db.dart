// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PostingData extends GetxController {
  static final PostingData instance = PostingData();
  static Database? _database;
  PostingData();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initdatabase();
    return _database!;
  }

  Future<Database> _initdatabase() async {
    Directory data_directory = await getApplicationDocumentsDirectory();
    print('DB Location:' + data_directory.path);
    final String path = join(await getDatabasesPath(), 'posting_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _CreateDatabase,
    );
  }

  Future<void> _CreateDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE post_table (
        id INTEGER PRIMARY KEY,
        name TEXT,
        fromdate TEXT,
        todate TEXT,
        location TEXT,
        zipcode TEXT,
        address TEXT,
        questions TEXT,
        technician TEXT
      )
    ''');
  }

  Future<int> insertpostdetail(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('post_table', row);
  }

  Future<List<Map<String, dynamic>>> getallpostdetails() async {
    Database db = await instance.database;
    return await db.query('post_table');
  }

  Future<int> updatepostdetails(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update('post_table', row, where: 'id=?', whereArgs: [id]);
  }

  Future<int> deletepostdetails(int id) async {
    Database db = await instance.database;

    return await db.delete('post_table', where: 'id=?', whereArgs: [id]);
  }
}
