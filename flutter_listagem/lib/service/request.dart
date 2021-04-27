import 'package:flutter_listagem/models/Autenticacao.dart';
import 'package:flutter_listagem/models/Carrinho.dart';
import 'package:flutter_listagem/models/RetornoAutenticacao.dart';
import 'package:flutter_listagem/models/compras.dart';
import 'package:flutter_listagem/models/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Migration.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Request {
  static final Request request = Request();
  static final String cabecalho = '10.10.196.247:8080';

  Future<RetornoAutenticacao> validarLogin(Autenticacao autenticacao) async {
    Uri url = Uri.http(cabecalho, '/autenticacaoService');

    final response = await http.post(url,
        headers: getHeadres(), body: json.encode(autenticacao.toMap()));

    if (response.statusCode == 200) {
      return RetornoAutenticacao.fromMap(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<List<Carrinho>> getCompras(int codigoUsuario) async {
    Uri url =
        Uri.http(cabecalho, '/adquirirPorUsuario/' + codigoUsuario.toString());

    final response = await http.get(url, headers: getHeadres());

    Iterable l = json.decode(response.body);
    return List<Carrinho>.from(l.map((model) => Carrinho.fromMap(model)));

    // return compras;
  }

  Future<Carrinho> editarCompras(Carrinho carrinho) async {
    Uri url = Uri.http(cabecalho, '/editar');

    final response = await http.put(url,
        headers: getHeadres(), body: json.encode(carrinho.toMap()));

    if (response.statusCode == 200) {
      return Carrinho.fromMap(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<Carrinho> salvarCompras(Carrinho carrinho) async {
    Uri url = Uri.http(cabecalho, '/salvar');

    final response = await http.post(url,
        headers: getHeadres(), body: json.encode(carrinho.toMap()));

    if (response.statusCode == 200) {
      return Carrinho.fromMap(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<List<RetornoAutenticacao>> validarLogin2(
      Autenticacao autenticacao) async {
    Uri url = Uri.http(cabecalho, '/autenticacaoService');

    final response = await http.post(url,
        headers: getHeadres(), body: json.encode(autenticacao.toMap()));

    Iterable l = json.decode(response.body);
    List<RetornoAutenticacao> posts = List<RetornoAutenticacao>.from(
        l.map((model) => RetornoAutenticacao.fromMap(model)));
  }

  Map<String, String> getHeadres() {
    Map<String, String> map = Map();
    map.addAll({'accept': 'application/json'});
    map.addAll({'content-type': 'application/json'});
    return map;
  }
}
