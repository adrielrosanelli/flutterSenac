import 'package:flutter/material.dart';
import 'package:flutter_listagem/service/DBProvider.dart';
import 'package:flutter_listagem/service/Request.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'HomePage.dart';
import 'models/Autenticacao.dart';
import 'models/RetornoAutenticacao.dart';
import 'models/usuario.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Autentificação'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final loginController = TextEditingController();
  final senhaController = TextEditingController();

  login({BuildContext context}) async {

    RetornoAutenticacao retorno = await Request.request.validarLogin(
        Autenticacao(senha:senhaController.text,login:loginController.text  ));

    if(retorno!=null){

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(retornoAtenticacao: retorno)));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: TextFormField(
                  controller: loginController,
                  onChanged: (value) {},
                  validator: (String value) {
                    return value.length > 3 ? null : "Informe um login valido";
                  },
                  decoration: InputDecoration(
                      hintText: 'Informe seu login', labelText: 'LOGIN'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: TextFormField(
                  controller: senhaController,
                  validator: (String value) {
                    return value.length > 3 ? null : "Informe uma senha valida";
                  },
                  decoration: InputDecoration(
                      hintText: 'Informe sua senha', labelText: 'SENHA'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: Color(0xff474747),
                  onPressed: () {
                    login(context: context);
                  },
                  child: Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
