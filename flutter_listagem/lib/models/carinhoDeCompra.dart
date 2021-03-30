import "dart:convert";

class CarrinhoDeCompras {
  int id;
  String nome;
  String data;
  int codigoDoUsuario;
  CarrinhoDeCompras({this.id, this.nome, this.data, this.codigoDoUsuario});

  factory CarrinhoDeCompras.fromMap(Map<String, dynamic> json) =>
      new CarrinhoDeCompras(
          id: json['id'],
          nome: json['nome'],
          data: json['data'],
          codigoDoUsuario: json['codigoDoUsuario']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'tx_nome': nome,
        "tx_data": data,
        'int_codigoDoUsuario': codigoDoUsuario,
      };
  CarrinhoDeCompras clientFromJson(String value) {
    final jsonData = json.decode(value);
    return CarrinhoDeCompras.fromMap(jsonData);
  }

  String clientToJson(CarrinhoDeCompras usuario) {
    final data = usuario.toMap();
    return json.encode(data);
  }
}
