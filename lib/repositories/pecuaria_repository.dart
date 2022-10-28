import 'package:http/http.dart' as http;
import 'package:forms/widgets/valores.dart';
import '../models/pecuaria_model.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class PecuariaRepository {
  //final baseUrl = Uri.http(Valor.baseUrl, '/v1/tipo_pecuaria');

  Future<List<PecuariaModel>> fetchPecuaria() async {
    try {
      /*final r = await http
          .get(baseUrl, headers: {"Content-Type": "application/json"});*/
      Dio dio = new Dio();
      final response = await dio.get(Valor.baseUrl + '/v1/tipo_pecuaria');

      final lista = response as List;
      print(lista);

      return lista.map((e) => PecuariaModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
