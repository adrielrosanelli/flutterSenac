import 'dart:convert';

class RetornoAutenticacao {
  String login;
  String senha;
  int codigo;
  String nome;

  RetornoAutenticacao({
    this.login,
    this.senha,
    this.codigo,
    this.nome,
  });

  factory RetornoAutenticacao.fromMap(Map<String, dynamic> json) =>
      new RetornoAutenticacao(
        login: json["login"],
        senha: json["senha"],
        codigo: json["codigo"],
        nome: json["nome"],
      );

  Map<String, dynamic> toMap() => {
        "login": login,
        "senha": senha,
        "codigo": codigo,
        "nome": nome,
      };

  RetornoAutenticacao clientFromJson(String value) {
    final jsonData = json.decode(value);
    return RetornoAutenticacao.fromMap(jsonData);
  }

  String toJson(RetornoAutenticacao autenticacao) {
    final data = autenticacao.toMap();
    return json.encode(data);
  }

  // Autenticacao.fromJson(Map<String, dynamic> json) {
  //   login = json['login'];
  //   senha = json['senha'];
  // }

}
