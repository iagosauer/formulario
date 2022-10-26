import 'package:http/http.dart' as http;
import 'package:forms/widgets/valores.dart';
import '../models/pecuaria_model.dart';
import 'dart:convert' as convert;

class PecuariaRepository {
  final baseUrl = Uri.http(Valor.baseUrl, '/tipo_pecuaria');

  Future<List<PecuariaModel>> fetchPecuaria() async {
    try {
      final response = await http.get(baseUrl);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      final lista = jsonResponse as List;

      return lista.map((e) => PecuariaModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
