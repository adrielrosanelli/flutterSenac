import 'package:flutter/material.dart';

import 'models/carinhoDeCompra.dart';

class TelaCarrinho extends StatefulWidget {
  final String nome;
  final int id;
  final List<CarrinhoDeCompras> carrinho;

  const TelaCarrinho({Key key, this.nome, this.id, this.carrinho})
      : super(key: key);

  @override
  _TelaCarrinhoState createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
