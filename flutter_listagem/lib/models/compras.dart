import "dart:convert";

class Compras {
  int id;
  int idUsuario;
  String nomeProduto;
  String data;
  Compras({this.id, this.idUsuario, this.nomeProduto, this.data});

  factory Compras.fromMap(Map<String, dynamic> json) => new Compras(
      id: json['id'],
      nomeProduto: json['nomeProduto'],
      data: json['data'],
      idUsuario: json['idUsuario']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'tx_nomeProduto': nomeProduto,
        "tx_data": data,
        'id_usuario': idUsuario
      };
  Compras clientFromJson(String value) {
    final jsonData = json.decode(value);
    return Compras.fromMap(jsonData);
  }

  String clientToJson(Compras compras) {
    final data = compras.toMap();
    return json.encode(data);
  }
}
