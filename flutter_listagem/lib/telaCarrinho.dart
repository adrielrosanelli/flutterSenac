import 'package:flutter/material.dart';
import 'package:flutter_listagem/service/DBProvider.dart';

import 'models/carinhoDeCompra.dart';

class TelaCarrinho extends StatefulWidget {
  final String nome;
  final String data;
  final int id;

  const TelaCarrinho({Key key, this.nome, this.data, this.id})
      : super(key: key);

  @override
  _TelaCarrinhoState createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  @override
  void initState() {
    print(widget.nome);
    print(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _nomeController = TextEditingController();
    TextEditingController _dataController = TextEditingController();
    _nomeController.text = widget.nome;
    _dataController.text = widget.data;

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.edit), onPressed: () {})],
      ),
      body: Center(
          child: Column(
        children: [
          TextFormField(
            controller: _nomeController,
          ),
          TextFormField(
            controller: _dataController,
          )
        ],
      )),
    );
  }
}
