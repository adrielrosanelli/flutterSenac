import 'dart:async';

import 'package:flutter/material.dart';

class Contato extends StatefulWidget {
  final String name;
  final String cidade;
  Contato(this.name, this.cidade);
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  final _pesoController = TextEditingController();
  final _nomeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato ' + widget.name + ' - ' + widget.cidade),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Digite seu Peso',
                ),
                keyboardType: TextInputType.number,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo Obrigatorio';
                  }
                },
                autofocus: true,
                controller: _pesoController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Digite seu Nome',
                ),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo Obrigatorio';
                  }
                },
                controller: _nomeController,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            AlertDialog loader = AlertDialog(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('Aguarde'),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return loader;
                });
            Timer(Duration(seconds: 3), () {
              Navigator.pop(context);
              AlertDialog alert = AlertDialog(
                title: Text('${_nomeController.text}'),
                backgroundColor: Colors.red[200],
                content: Text('Seu peso é ${_pesoController.text}'),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  )
                ],
              );
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  });
            });
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
