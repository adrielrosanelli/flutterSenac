import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // alignment: Alignment.center,
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            hintText: 'exemplo@exemplo.com'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                            hintText: 'Jose da Silva',
                            suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  log('tua mãe é minha');
                                })),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 180,
                          child: CheckboxListTile(
                            title: Text('Lembrar Senha'),
                            value: true,
                            dense: true,
                            onChanged: (value) {
                              value = !value;
                            },
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {},
                    child: Text('Cadastrar-se'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.brown[300]),
                    onPressed: () {
                      Get.to(Home());
                    },
                    child: Text('Entrar'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
