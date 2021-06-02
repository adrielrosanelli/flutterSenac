import "dart:convert";

class Usuario {
  int id;
  String nome;
  String login;
  String senha;
  Usuario({this.id, this.nome, this.login, this.senha});

  factory Usuario.fromMap(Map<String, dynamic> json) => new Usuario(
      id: json['id'],
      nome: json['nome'],
      login: json['login'],
      senha: json['senha']);



  Map<String, dynamic> toMap() =>
      {'id': id, 'tx_nome': nome, "tx_login": login, 'tx_senha': senha};
  Usuario clientFromJson(String value) {
    final jsonData = json.decode(value);
    return Usuario.fromMap(jsonData);
  }

  String clientToJson(Usuario usuario) {
    final data = usuario.toMap();
    return json.encode(data);
  }
}