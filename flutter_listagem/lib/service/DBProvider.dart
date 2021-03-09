import 'package:flutter_listagem/models/usuario.dart';
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

  Future<void> salvar(Usuario usuario) async {
    Database db = await database;
    await db.insert("tb_usuario", usuario.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> delete(int id) async {
    Database db = await database;
    await db.delete("tb_usuario", where: "id =?", whereArgs: [id]);
  }

  Future<Usuario> getById(int id) async {
    Database db = await database;

    List<Map<String, dynamic>> maps =
        await db.query('tb_usuario', where: 'id = ?', whereArgs: [id]);
    print('${maps.first}');
    List<Usuario> users = List.generate(
        maps.length,
        (i) => Usuario(
            id: maps[i]['id'],
            nome: maps[i]['tx_nome'],
            login: maps[i]['tx_login'],
            senha: maps[i]["tx_senha"]));

    if (users.length > 0) {
      return users[0];
    }
    return null;
  }

  Future<Usuario> getByUsuarioSenha({String login, String senha}) async {
    Database db = await database;

    List<Map<String, dynamic>> maps = await db.query('tb_usuario',
        where: 'tx_login = ? and tx_senha = ?', whereArgs: [login, senha]);
    print('${maps.first}');
    List<Usuario> users = List.generate(
        maps.length,
        (i) => Usuario(
            id: maps[i]['id'],
            nome: maps[i]['tx_nome'],
            login: maps[i]['tx_login'],
            senha: maps[i]["tx_senha"]));

    if (users.length > 0) {
      return users[0];
    }
    return null;
  }
}
