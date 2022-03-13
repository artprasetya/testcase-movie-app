import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final String tableName = "User";
  final String columnId = "id";
  final String columnUserName = "username";
  final String columnEmail = "email";
  final String columnPassword = "password";

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "auth.db");
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreateDatabase,
    );

    return database;
  }

  FutureOr<void> onCreateDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, $columnUserName TEXT, $columnEmail TEXT, $columnPassword TEXT)");
  }
}
