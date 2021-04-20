import 'dart:convert';
// import 'dart:html';

import 'package:flutter_listagem/models/RetornoAutentificacao.dart';
import 'package:flutter_listagem/models/autentificacao.dart';
import 'package:flutter_listagem/models/carrinho.dart';
import 'package:http/http.dart' as http;

class Request {
  static final Request request = Request();
  static final String cabecalho = "10.10.196.156:8080";

  Future<RetornoAutenticacao> validaLogin(Autenticacao autenticacao) async {
    Uri url = Uri.http(cabecalho, "/autenticacaoService");
    final response = await http.post(url,
        headers: getHeaders(), body: json.encode(autenticacao.toMap()));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return RetornoAutenticacao.fromMap(jsonDecode(response.body));
    } else {
      print('teste');
      return null;
    }
  }

  Map<String, String> getHeaders() {
    Map<String, String> map = Map();
    map.addAll({"accept": "application/json"});
    map.addAll({"content-type": "application/json"});
    return map;
  }

  Future<List<Carrinho>> getCompras(int codigoUsuario) async {
    Uri url =
        Uri.http(cabecalho, "/adquirirPorUsuario/" + codigoUsuario.toString());
    final response = await http.get(url, headers: getHeaders());

    Iterable l = json.decode(response.body);
    Future<List<Carrinho>> compras = List<RetornoAutenticacao>.from(
        l.map((e) => RetornoAutenticacao.fromMap(e))) as Future<List<Carrinho>>;

    return compras;
  }

  Future<List<Carrinho>> salvarCompras(Carrinho carrinho) async {
    Uri url = Uri.http(cabecalho, "/salvar");
    final response = await http.post(url,
        headers: getHeaders(), body: json.encode(Carrinho.toMap()));

    Iterable l = json.decode(response.body);
    Future<List<Carrinho>> compras = List<RetornoAutenticacao>.from(
        l.map((e) => RetornoAutenticacao.fromMap(e))) as Future<List<Carrinho>>;

    return compras;
  }
}
