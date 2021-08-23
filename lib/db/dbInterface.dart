import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vocab_trainer/db/dbManagement.dart';

import '../config/consts.dart';

class DbInterface {
  static DbInterface _database = DbInterface._internal();

  late String _databaseName;
  late int _databaseVersion;

  late Database _db;

  DbInterface._internal() {
    _databaseName = DB_NAME;
    _databaseVersion = DB_VERSION;
  }

  factory DbInterface() {
    return _database;
  }

  Future<Database> get db async {
    if (_db == null) {
      _db = await initDatabase();
    }
    return _db;
  }

  Future<Database> initDatabase() async {
    Directory dbDir = await getApplicationDocumentsDirectory();
    String dbpath = dbDir.path + "/" + _databaseName;
    DbManagement _createDb = new DbManagement();

    var db = await openDatabase(dbpath,
        version: _databaseVersion,
        onCreate: _createDb.createDatabase,
        onOpen: _createDb.openDatabase,
        onUpgrade: _createDb.upgradeDatabase);
    return db;
  }
}

