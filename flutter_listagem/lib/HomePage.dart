import 'package:flutter/material.dart';
import 'package:flutter_listagem/Cadastro.dart';
import 'package:flutter_listagem/service/DBProvider.dart';
import 'models/usuario.dart';

class HomePage extends StatelessWidget {
  final Usuario usuario;

  abrirEditar(context, item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Cadastro(
                usuario: usuario,
                compras: item,
              )),
    );

    return print(item.data + " " + item.nomeProduto);
  }

  HomePage({Key key, @required this.usuario}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Compras')),
      body: FutureBuilder<List>(
          future: DBProvider.db.getAllCompras(),
          initialData: List(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (x, int position) {
                      final item = snapshot.data[position];
                      return GestureDetector(
                          onDoubleTap: () => abrirEditar(context, item),
                          child: Card(
                            child: ListTile(
                              tileColor: const Color(0xFF506AD4),
                              title: Text(
                                "Compra: " + item.nomeProduto,
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                "data da compra: " + item.data,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ));
                    },
                  )
                : Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Cadastro(
                        usuario: usuario,
                        compras: null,
                      )));
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
