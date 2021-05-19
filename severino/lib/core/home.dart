import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.orange,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Card(
            color: Colors.grey,
            child: Form(
              child: Column(children: [
                Flexible(
                  child: TextFormField(),
                )
              ]),
            )),
      ]),
    ));
  }
}
