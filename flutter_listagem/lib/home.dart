import 'package:flutter/material.dart';

import 'models/usuario.dart';

class Home extends StatelessWidget {
  final String login;
  final String senha;
  final Usuario usuario;
  Home({this.login, this.senha, this.usuario});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Lista de compras"),
      ),
      body: Center(
        child: Text(usuario.nome),
      ),
    );
  }
}
