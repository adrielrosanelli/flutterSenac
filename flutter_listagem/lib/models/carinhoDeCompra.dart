import "dart:convert";

class CarrinhoDeCompras {
  int id;
  String nome;
  String data;
  bool status;
  String codigoDeBarras;
  CarrinhoDeCompras(
      {this.id, this.nome, this.data, this.status, this.codigoDeBarras});

  factory CarrinhoDeCompras.fromMap(Map<String, dynamic> json) =>
      new CarrinhoDeCompras(
          id: json['id'],
          nome: json['nome'],
          data: json['data'],
          status: json['status'],
          codigoDeBarras: json['codigoDeBarras']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'tx_nome': nome,
        "tx_data": data,
        'tx_status': status,
        'tx_codigoDeBarras': codigoDeBarras,
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
