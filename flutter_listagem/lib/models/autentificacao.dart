import 'dart:convert';

class Autenticacao {
  String login;
  String senha;

  Autenticacao({this.login, this.senha});

  factory Autenticacao.fromMap(Map<String, dynamic> json) =>
      new Autenticacao(login: json["login"], senha: json["senha"]);

  Map<String, dynamic> toMap() => {"login": login, "senha": senha};

  Autenticacao clientFromJson(String value) {
    final jsonData = json.decode(value);
    return Autenticacao.fromMap(jsonData);
  }

  String toJson(Autenticacao autenticacao) {
    final data = autenticacao.toMap();
    return json.encode(data);
  }

  // Autenticacao.fromJson(Map<String, dynamic> json) {
  //   login = json['login'];
  //   senha = json['senha'];
  // }

}
