import 'dart:io';
import 'package:debt_collector/db/table_data_constants.dart';
import 'package:debt_collector/db/table_queries_constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String _databaseName = "debt_collector.db";
  static final int _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(TableQueriesConstants.CREATE_USER_TABLE_QUERY);
    await db.execute(TableQueriesConstants.CREATE_BILL_TABLE_QUERY);
    await db.execute(TableQueriesConstants.CREATE_CLIENT_TABLE_QUERY);
  }

  Future<List<Map<String, dynamic>>> queryAllUsersRows() async {
    Database db = await instance.database;
    return await db.query(TableDataConstants.userTableName);
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(TableDataConstants.userTableName, row);
  }

  Future<List<Map<String, dynamic>>> getAllBills() async {
    Database db = await instance.database;
    return await db.query(TableDataConstants.billTableName);
  }

  Future<List<Map<String, dynamic>>> getAllClients() async {
    Database db = await instance.database;
    return await db.query(TableDataConstants.clientTableName);
  }
}