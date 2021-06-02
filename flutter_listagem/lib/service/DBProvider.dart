import 'package:flutter_listagem/models/compras.dart';
import 'package:flutter_listagem/models/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Migration.dart';

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
      Migration.migration.getAllScript().forEach((x) {
        db.execute(x);
      });
    }, onUpgrade: (db, oldVersion, newVersion) {
      for (int i = oldVersion + 1; i <= newVersion; i++) {
        Migration.migration.getScript(i).forEach((x) {
          db.execute(x);
        });
      }
    }, version: 9);
  }

  Future<int> salvarCompra(Compras compras,
      {String data, String nomeProduto, int idUsuario}) async {
    Database db = await database;
    return await db.insert("tb_compras", compras.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
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

  Future<void> deleteCompras(int id) async {
    Database db = await database;
    await db.delete("tb_compras", where: "id =?", whereArgs: [id]);
  }

  Future<List<Compras>> getAllCompras() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('tb_compras');
    List<Compras> compras = List.generate(maps.length, (i) {
      return Compras(
          id: maps[i]['id'],
          nomeProduto: maps[i]['tx_nomeProduto'],
          data: maps[i]['tx_data'],
          idUsuario: maps[i]["id_usuario"]);
    });
    return compras;
  }

  Future<List<Usuario>> getAll() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('tb_usuario');
    List<Usuario> users = List.generate(maps.length, (i) {
      return Usuario(
          id: maps[i]['id'],
          nome: maps[i]['tx_nome'],
          login: maps[i]['tx_login'],
          senha: maps[i]["tx_senha"]);
    });
    return users;
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
