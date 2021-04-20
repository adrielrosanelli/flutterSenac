import 'dart:convert';

class Carrinho {
  int id;
  int codigoUsuario;
  String data;
  String nome;

  Carrinho({
    this.id,
    this.codigoUsuario,
    this.data,
    this.nome,
  });

  factory Carrinho.fromMap(Map<String, dynamic> json) => new Carrinho(
        id: json["id"],
        codigoUsuario: json["codigoUsuario"],
        data: json["data"],
        nome: json["nome"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "codigoUsuario": codigoUsuario,
        "data": data,
        "nome": nome,
      };

  Carrinho clientFromJson(String value) {
    final jsonData = json.decode(value);
    return Carrinho.fromMap(jsonData);
  }

  String toJson(Carrinho autenticacao) {
    final data = autenticacao.toMap();
    return json.encode(data);
  }

  // Autenticacao.fromJson(Map<String, dynamic> json) {
  //   login = json['login'];
  //   senha = json['senha'];
  // }

}
