import "dart:convert";

class Autenticacao {
  String senha;
  String login;
  Autenticacao({this.senha, this.login});

  factory Autenticacao.fromMap(Map<String, dynamic> json) => new Autenticacao(
      senha: json['senha'],
      login: json['login'] );

  Map<String, dynamic> toMap() => {
    'senha': senha,
    'login': login
  };
  Autenticacao clientFromJson(String value) {
    final jsonData = json.decode(value);
    return Autenticacao.fromMap(jsonData);
  }

  String toJson(Autenticacao autenticacao) {
    final data = autenticacao.toMap();
    return json.encode(data);
  }
}
