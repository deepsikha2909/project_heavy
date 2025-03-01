// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TechPostingData extends GetxController {
  static final TechPostingData instance = TechPostingData();
  static Database? _database;
  TechPostingData();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initdatabase();
    return _database!;
  }

  Future<Database> _initdatabase() async {
    Directory data_directory = await getApplicationDocumentsDirectory();
    print('DB Location:' + data_directory.path);
    final String path = join(await getDatabasesPath(), 'tech_posting_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _CreateDatabase,
    );
  }

  Future<void> _CreateDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tech_post_table (
        id INTEGER PRIMARY KEY,
        name TEXT,
        contact TEXT,
        skills TEXT,
        experience TEXT,
        specialist TEXT,
        address TEXT,
        queries TEXT,
        jobname TEXT
      )
    ''');
  }

  Future<int> insertpostdetail(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('tech_post_table', row);
  }

  Future<List<Map<String, dynamic>>> getallpostdetails() async {
    Database db = await instance.database;
    return await db.query('tech_post_table');
  }

  Future<int> updatepostdetails(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db
        .update('tech_post_table', row, where: 'id=?', whereArgs: [id]);
  }

  Future<int> deletepostdetails(int id) async {
    Database db = await instance.database;

    return await db.delete('tech_post_table', where: 'id=?', whereArgs: [id]);
  }
}
