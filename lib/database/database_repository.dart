import 'package:majootestcase/database/database_helper.dart';
import 'package:majootestcase/models/user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepository {
  DatabaseHelper _dbHelper = DatabaseHelper();

  static Database? _db;

  Future<Database?> get database async {
    if (_db != null) return _db;
    _db = await _dbHelper.initDatabase();
    return _db;
  }

  Future<int?> register(String table, Map<String, dynamic> data) async {
    var db = await database;
    return await db?.insert(table, data);
  }

  // function used to get all the data from the table
  Future<List<Map<String, Object?>>?> getData(String table) async {
    var db = await database;
    return await db?.query('User');
  }

  Future<bool> selectUser(User user) async {
    final String tableName = "User";
    final String columnId = "id";
    final String columnUserName = "username";
    final String columnEmail = "email";
    final String columnPassword = "password";

    var db = await database;

    bool? _isExist = false;

    List<Map<String, dynamic>>? result = await db?.query(tableName,
        columns: [
          columnId,
          columnUserName,
          columnEmail,
          columnPassword,
        ],
        where: "$columnEmail = ? and $columnPassword = ?",
        whereArgs: [user.email, user.password]);

    if (result != null && result.isNotEmpty) return _isExist = true;

    return _isExist;
  }
}
