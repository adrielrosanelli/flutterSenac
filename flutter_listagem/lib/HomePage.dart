import 'package:flutter/material.dart';
import 'package:flutter_listagem/Cadastro.dart';
import 'package:flutter_listagem/service/DBProvider.dart';
import 'package:flutter_listagem/service/Request.dart';
import 'models/RetornoAutenticacao.dart';
import 'models/usuario.dart';

class HomePage extends StatefulWidget {
  final RetornoAutenticacao retornoAtenticacao;

  HomePage({Key key, @required this.retornoAtenticacao}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Compras')),
      body: FutureBuilder<List>(
          future: Request.request.getCompras(widget.retornoAtenticacao.codigo),
          initialData: [],
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (x, int position) {
                      final item = snapshot.data[position];
                      return GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cadastro(
                                          codigoUsuario:
                                              widget.retornoAtenticacao.codigo,
                                          compras: item,
                                        ))).then((value) {
                              setState(() {
                                widget.createState();
                              });
                            });
                          },
                          child: Card(
                            child: ListTile(
                              tileColor: const Color(0xFF506AD4),
                              title: Text(
                                "Compra: " + item.nome,
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
                        codigoUsuario: widget.retornoAtenticacao.codigo,
                        compras: null,
                      ))).then((value) {
            setState(() {
              widget.createState();
            });
          });
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
