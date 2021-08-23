import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:vocab_trainer/config/consts.dart';
import 'dbVersions.dart';

class DbManagement {
  FutureOr<void> createDatabase(Database db, int version) async {
    Map<int, dynamic> versions = this.versions();
    versions.forEach((versionID, scriptmaps) {
      if(versionID <= version) {
        scriptmaps.forEach((id, script){
          db.execute(script);
        });
      }
    });
  }

  FutureOr<void> upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    Map<int, dynamic> versions = this.versions();
    versions.forEach((version, scriptmaps) {
      if(version > oldVersion && version <= newVersion) {
        scriptmaps.forEach((id, script){
          db.execute(script);
        });
      }
     });
  }

  FutureOr<void> openDatabase(Database db) async {

  }

  Map<int, dynamic> versions() {
    Map<int, dynamic> versions = new Map<int, dynamic>();

    versions[1] = DB_VERSION;
    return versions;
  }
}