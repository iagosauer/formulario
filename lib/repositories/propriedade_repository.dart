import 'package:forms/models/propriedade_model.dart';
import 'package:http/http.dart' as http;
import 'package:forms/widgets/valores.dart';
import 'dart:convert' as convert;

class PropriedadeRepository {
  //final baseUrl = Uri.http(Valor.baseUrl, '/v1/propriedade');
  var lista;

  Future<List<PropriedadeModel>> fetchProprietario() async {
    try {
      final response =
          await http.get(Uri.parse('${Valor.baseUrl}/v1/propriedade'));

      /*await http
          .get(baseUrl, headers: {"Content-Type": "application/json"});*/
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        lista = jsonResponse as List;
        print('Status = 200');
      } else {
        int i = response.statusCode;
        print('Status = $i');
      }

      return lista.map((e) => PropriedadeModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
