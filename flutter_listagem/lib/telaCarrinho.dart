import 'package:flutter/material.dart';
import 'package:flutter_listagem/service/DBProvider.dart';

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
      body: FutureBuilder<List>(
        future: DBProvider.db.getAllCarrinho(),
        initialData: [],
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (x, int position) {
                    final item = snapshot.data[position];
                    return Card(
                        child: ListTile(
                      title: Text('Compra' + item.login),
                    ));
                  })
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
