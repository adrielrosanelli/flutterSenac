import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'models/carinhoDeCompra.dart';
import 'models/carinhoDeCompra.dart';
import 'models/usuario.dart';
import 'service/DBProvider.dart';
import 'telaCarrinho.dart';

class Home extends StatelessWidget {
  final String login;
  final String senha;
  final Usuario usuario;
  final List<CarrinhoDeCompras> carrinho;
  Home({this.login, this.senha, this.usuario, this.carrinho});
  final _nomeController = TextEditingController();
  final _dataController = TextEditingController();
  compras({BuildContext context}) async {
    _nomeController.text = 'jonas';
    _dataController.text = '10/05/2012';
    CarrinhoDeCompras carrinhoDeCompras = CarrinhoDeCompras(
        nome: _nomeController.text,
        id: null,
        data: _dataController.text,
        codigoDoUsuario: usuario.id);

    DBProvider.db.salvarCarrinho(carrinhoDeCompras);
    print('passou');
    List<CarrinhoDeCompras> carrinhoSalvo =
        await DBProvider.db.getAllCarrinho();

    print('nome : ${_nomeController.text} data: ${_dataController.text}');
    if (carrinhoSalvo != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    login: login,
                    // nome: _nomeController.text,
                    carrinho: carrinhoSalvo,
                  )));
    } else {
      Fluttertoast.showToast(
          msg: "Login ou senha Inválido(s)",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            compras(context: context);
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Lista de compras"),
        ),
        body: FutureBuilder<List>(
          future: DBProvider.db.getAllCarrinho(),
          initialData: [],
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (x, int position) {
                      final item = snapshot.data[position];
                      return GestureDetector(
                        onDoubleTap: () => abrirEditar(BuildContext(), item),
                        child: Card(
                            child: ListTile(
                          title: Text('Compra' + item.nome),
                        )),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        )
        // Container(
        //   child: Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         TextFormField(
        //           controller: _nomeController,
        //           decoration: InputDecoration(
        //               hintText: 'Informe o nome do produto',
        //               labelText: 'Produto'),
        //         ),
        //         TextFormField(
        //           keyboardType: TextInputType.datetime,
        //           controller: _dataController,
        //           decoration: InputDecoration(
        //               hintText: 'Informe a data', labelText: 'Data'),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
