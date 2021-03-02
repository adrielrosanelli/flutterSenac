import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static final DBProvider db = DBProvider();
  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'compraae.db'),
        onCreate: (db, version) {
      return db.execute(
          "create table tb_usuario( id integer primary key, tx_nome text, tx_login text,tx_senha text)");
    }, onUpgrade: (db, oldVersion, newVersion) {
      db.execute("");
    }, version: 1);
  }
}
