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
    _contactController.image.value = '';
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: new AppBar(title: Text("Adicionar contato")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //acessa o controlador ContactController e executa a função
            //addData()
            _contactController.addData();
          },
          child: Icon(Icons.save)),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _contactController.formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _contactController.nomeContactController,
                  decoration: InputDecoration(hintText: "Digite o nome"),
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Obrigatorio';
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  controller: _contactController.emailContactController,
                  decoration: InputDecoration(hintText: "Digite o Email"),
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Obrigatorio';
                    } else {
                      return (!GetUtils.isEmail(value))
                          ? "Email não é valido"
                          : null;
                    }
                  },
                ),
                TextFormField(
                  controller: _contactController.siteContactController,
                  decoration: InputDecoration(hintText: "Digite o Link"),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Obrigatorio';
                    } else {
                      return (!GetUtils.isURL(value))
                          ? "Link não é valido"
                          : null;
                    }
                  },
                ),
                TextFormField(
                  controller: _contactController.telefoneContactController,
                  decoration: InputDecoration(hintText: "Digite o telefone"),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Obrigatorio';
                    } else {
                      return (!GetUtils.isPhoneNumber(value))
                          ? "Link não é valido"
                          : null;
                    }
                  },
                ),
                TextFormField(
                    controller: _contactController.descricaoContactController,
                    decoration: InputDecoration(hintText: "Digite a descrição"),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo Obrigatorio';
                      }
                    },
                    textInputAction: TextInputAction.done),
                Obx(
                  () => _contactController.image.value != ''
                      ? Column(
                          children: [
                            Image.file(File(_contactController.image.value)),
                            TextButton(
                                onPressed: () => _contactController.getImage(),
                                child: Row(
                                  children: [
                                    Icon(Icons.image),
                                    Text('Alterar Foto')
                                  ],
                                )),
                          ],
                        )
                      : TextButton(
                          onPressed: () => _contactController.getImage(),
                          child: Row(
                            children: [Icon(Icons.image), Text('Tirar Foto')],
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
