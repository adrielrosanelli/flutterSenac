class ContactModel {
  int id;
  String nome;
  String descricao;
  String foto;
  String email;
  String site;
  String telefone;
  String latitude;
  String longetude;

  //"Executa" a classe recebendo os parâmetros
  ContactModel(
      {this.id,
      this.nome,
      this.descricao,
      this.email,
      this.foto,
      this.site,
      this.latitude,
      this.longetude,
      this.telefone});

  //cria o mapa de dados da classe
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'email': email,
      'foto': foto,
      'site': site,
      'longetude': longetude,
      'latitude': latitude,
      'telefone': telefone
    };
  }
}
