import 'dart:io';

import 'package:contactlist/controller/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  //injeta o controllador ContactController na classe AddPage
  //deixando-o acessível na variável _contactController
  final ContactController _contactController = Get.put(ContactController());
  @override
  Widget build(BuildContext context) {
    //limpa a variável imagem, caso o usuário tenha tirado uma foto e voltado para a lista sem salvar, ao retornar na tela de cadastro a imagem deve ser vazia
    _contactController.image.value = '';
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: new AppBar(title: Text("Add contact to list")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //acessa o controlador ContactController e executa a função
            //addData()
            if (_contactController.image.isEmpty) {
              Get.defaultDialog(
                  titleStyle: TextStyle(color: Colors.white),
                  title: 'Imagem Obrigatória',
                  content: Text(
                    'A foto do contato é obrigatória',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red[200]);
            } else {
              _contactController.addData();
            }
          },
          child: Icon(Icons.save)),
      body: SingleChildScrollView(
        child: Form(
          key: _contactController.form,
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _contactController.nomeContactController,
                  decoration: InputDecoration(hintText: "Enter your name"),
                  autofocus: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Required field";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _contactController.descricaoContactController,
                  decoration: InputDecoration(
                      hintText: "Enter your personal description"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Required field";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _contactController.emailContactController,
                  decoration: InputDecoration(hintText: "Enter your e-mail"),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return (!GetUtils.isEmail(value))
                          ? "Email is not valid"
                          : null;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _contactController.siteContactController,
                  decoration:
                      InputDecoration(hintText: "Enter your internet link"),
                  keyboardType: TextInputType.url,
                  //ao clicar no Enter do teclado, vai para o próximo campo
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return (!GetUtils.isURL(value))
                          ? "Link is not valid"
                          : null;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _contactController.telefoneContactController,
                  decoration:
                      InputDecoration(hintText: "Enter your cell phone"),
                  keyboardType: TextInputType.number,
                  //ao clicar no Enter do teclado, fecha o teclado.
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return "Phone is not valid";
                    }
                    return null;
                  },
                ),
                Obx(
                  //cria o observável do Getx para exibir a imagem tirada na câmera na tela.(atualiza automaticamente baseado nas variáveis .obs)
                  () => _contactController.image.value !=
                          "" //se existir um caminho de imagem, exibe a imagem na tela
                      ? Column(
                          children: [
                            TextButton(
                              onPressed: () => _contactController.getImage(),
                              child: Row(
                                children: [
                                  Icon(Icons.image),
                                  Text('Update a picture')
                                ],
                              ),
                            ),
                            //exibe a imagem na tela a partir da contrução de um arquivo baseando-se no caminho dele
                            Image.file(File(_contactController.image.value))
                          ],
                        )
                      : TextButton(
                          //aciona a função de abertura da câmera
                          onPressed: () => _contactController.getImage(),
                          child: Row(
                            children: [
                              Icon(Icons.image),
                              Text('Take a picture')
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
