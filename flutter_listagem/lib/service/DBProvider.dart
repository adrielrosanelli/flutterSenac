import 'package:flutter_listagem/migration.dart';
import 'package:flutter_listagem/models/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/carinhoDeCompra.dart';

class DBProvider {
  static final DBProvider db = DBProvider();
  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'compraae.db'),
      version: 1,
      onCreate: (db, version) {
        Migration.migration.getAllSricpt().forEach((element) {
          db.execute(element);
        });
      },
      onUpgrade: (db, oldVersion, newVersion) {
        for (var i = oldVersion + 1; i <= newVersion; i++) {
          Migration.migration.getScript(i).forEach((element) {
            db.execute(element);
          });
        }
        // db.execute(
        //     "create table tb_carrinhoCompras(id integer primary key, tx_nome, tx_data,int_codigoDoUsuario)");
      },
    );
  }

  Future<void> salvar(Usuario usuario) async {
    Database db = await database;
    await db.insert("tb_usuario", usuario.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> salvarCarrinho(CarrinhoDeCompras carrinhoDeCompras) async {
    Database db = await database;
    await db.insert("tb_carrinhoCompras", carrinhoDeCompras.toMap(),
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

  Future<List<CarrinhoDeCompras>> getAllCarrinho() async {
    Database db = await database;

    List<Map<String, dynamic>> maps = await db.query('tb_carrinhoCompras');
    print('${maps.first}');
    List<CarrinhoDeCompras> carrinho;
    if (maps.length < 0) {
      carrinho = [];
    } else {
      carrinho = List.generate(
          maps.length,
          (i) => CarrinhoDeCompras(
              id: maps[i]['id'],
              nome: maps[i]['tx_nome'],
              data: maps[i]['tx_data'],
              codigoDoUsuario: maps[i]["int_codigoDoUsuario"]));
    }

    return carrinho;
  }
}
