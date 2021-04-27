import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_listagem/Contato.dart';
import 'package:flutter_listagem/HomePage.dart';
import 'package:flutter_listagem/models/Carrinho.dart';
import 'package:flutter_listagem/models/compras.dart';
import 'package:flutter_listagem/service/DBProvider.dart';
import 'package:flutter_listagem/service/Request.dart';
import 'models/usuario.dart';

class Cadastro extends StatefulWidget {
  final int codigoUsuario;
  final Carrinho compras;

  Cadastro({Key key, @required this.codigoUsuario, @required this.compras})
      : super(key: key);

  @override
  _CadastroState createState() =>
      _CadastroState(codigoUsuario: codigoUsuario, compras: compras);
}

class _CadastroState extends State<Cadastro> {
  final int codigoUsuario;
  final Carrinho compras;

  _CadastroState(
      {Key key, @required this.codigoUsuario, @required this.compras});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _nomeCadastroController = TextEditingController();
  TextEditingController _dataCadastroController = TextEditingController();

  salvarCompras({
    BuildContext context,
  }) async {
    Carrinho carrinho = Carrinho(
        codigoUsuario: codigoUsuario,
        nome: _nomeCadastroController.text,
        data: _dataCadastroController.text);
    Carrinho carrinhoSalvo;
    if (compras != null) {
      carrinho.id = compras.id;
      carrinhoSalvo = await Request.request.editarCompras(carrinho);
    } else {
      carrinhoSalvo = await Request.request.salvarCompras(carrinho);
    }

    carrinhoSalvo = await Request.request.salvarCompras(carrinho);
    if (carrinhoSalvo != null) {
      print('inseriu com sucesso');
      Navigator.pop(context);
    } else {
      print('falhou');
    }
  }

  @override
  Widget build(BuildContext context) {
    _nomeCadastroController.text = compras == null ? '' : compras.nome;
    _dataCadastroController.text = compras?.data;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nomeCadastroController,
                decoration: InputDecoration(hintText: "Digite o nome"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: true,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo Obrigatório";
                  }
                },
              ),
              TextFormField(
                controller: _dataCadastroController,
                decoration: InputDecoration(hintText: "Digite a data"),
                cursorRadius: Radius.zero,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo Obrigatório";
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
        ),
        onPressed: () {
          salvarCompras(context: context);
        },
      ),
    );
  }
}
