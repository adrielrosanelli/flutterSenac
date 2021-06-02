class Migration {
  static final Migration migration = Migration();

  Map<int, List<String>> migrationScripts = {
    1: [
      "create table tb_usuario(id integer primary key, tx_nome text, tx_login text,"
          "tx_senha text);",
      "delete from tb_usuario"
    ],
    2: [
      "insert into tb_usuario(tx_nome,tx_login,tx_senha) values ('abcd','abcd','abcd');"
    ],
    3: [
      "create table tb_compras(id integer primary key, tx_nomeProduto text, tx_data text, id_usuario int);",
    ]
  };

  List<String> getScript(int versao) {
    var map = migrationScripts.entries.firstWhere(
      (element) => element.key == versao,
      orElse: () => null,
    );

    return map == null ? [] : map.value;
  }

  List<String> getAllScript() {
    List<String> retorno = List();
    migrationScripts.entries.forEach((x) {
      retorno.addAll(x.value);
    });
    return retorno;
  }
}
