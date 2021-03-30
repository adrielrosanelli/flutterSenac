class Migration {
  static final Migration migration = Migration();

  Map<int, List<String>> migrationScripts = {
    1: [
      " create table tb_usuario(id integer primary key, tx_nome text, tx_login text,tx_senha text);",
      "insert into tb_usuario(tx_nome,tx_login,tx_senha) values ('abc','abc','abc')"
    ],
    2: [
      "delete from tb_usuario;",
      "insert into tb_usuario(tx_nome,tx_login,tx_senha) values('abcd','abcd','abcd');"
    ],
    3: [
      "create table tb_carrinhoCompras(id integer primary key, tx_nome text,tx_data text,int_codigoDoUsuario integer);",
      // "insert into tb_carrinhoCompras('abcd','abcd','abcd');"
    ]
  };

  List<String> getScript(int versao) {
    var map = migrationScripts.entries
        .firstWhere((element) => element.key == versao, orElse: () => null);
    return map?.value ?? [];
    // return map == null ? [] : map.value;
  }

  List<String> getAllSricpt() {
    List<String> retorno = [];
    migrationScripts.entries.forEach((element) {
      retorno.addAll(element.value);
    });
    return retorno;
  }
}
