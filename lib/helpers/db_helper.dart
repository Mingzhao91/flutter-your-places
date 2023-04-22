import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sql.dart';

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    // get the default database location
    final dbPath = await sql.getDatabasesPath();
    // open batabase if it's found, otherwise, create a database
    final sqlDb = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        // run some code to initialise the db when it's created at the first time
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
      version: 1,
    );

    // ConflictAlgorithm.replace: if we try to insert data with the same id, it will overwrite it with
    // the new data
    await sqlDb.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
