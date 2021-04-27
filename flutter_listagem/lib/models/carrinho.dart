import "dart:convert";

class Carrinho {
  int id;
  int codigoUsuario;
  String nome;
  String data;


  Carrinho({this.id, this.codigoUsuario,this.nome,this.data});

  factory Carrinho.fromMap(Map<String, dynamic> json) => new Carrinho(
      id: json['id'],
      codigoUsuario: json['codigoUsuario'],
      nome: json['nome'],
      data: json['data']);

  Map<String, dynamic> toMap() => {
    'id': id,
    'codigoUsuario': codigoUsuario,
    'nome': nome,
    'data': data
  };
  Carrinho clientFromJson(String value) {
    final jsonData = json.decode(value);
    return Carrinho.fromMap(jsonData);
  }

  String clientToJson(Carrinho carrinho) {
    final data = carrinho.toMap();
    return json.encode(data);
  }
}
