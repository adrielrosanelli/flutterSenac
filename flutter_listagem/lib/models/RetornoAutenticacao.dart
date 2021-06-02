import "dart:convert";

class RetornoAutenticacao {
  String senha;
  String login;
  int codigo;
  String nome;


  RetornoAutenticacao({this.senha, this.login,this.codigo,this.nome});

  factory RetornoAutenticacao.fromMap(Map<String, dynamic> json) => new RetornoAutenticacao(
      senha: json['senha'],
      login: json['login'],
      codigo: json['codigo'],
      nome: json['nome']);

  Map<String, dynamic> toMap() => {
    'senha': senha,
    'login': login,
    'codigo': codigo,
    'nome': nome
  };
  RetornoAutenticacao clientFromJson(String value) {
    final jsonData = json.decode(value);
    return RetornoAutenticacao.fromMap(jsonData);
  }

  String clientToJson(RetornoAutenticacao retornoAutenticacao) {
    final data = retornoAutenticacao.toMap();
    return json.encode(data);
  }
}
