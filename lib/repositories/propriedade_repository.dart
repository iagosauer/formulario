import 'package:dio/dio.dart';
import 'package:forms/models/propriedade_model.dart';
import 'package:forms/Auxiliares/Valores.dart';

class PropriedadeRepository {
  final dio = Dio();

  Future<List<PropriedadeModel>> fetchProprietario() async {
    try {
      final response = await dio.get('${Valor.baseUrl}/propriedade');
      final lista = response.data as List;
      return lista.map((e) => PropriedadeModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<PropriedadeModel> fetchPropriedade(String numero) async {
    try {
      final response = await dio.get('${Valor.baseUrl}/propriedade/$numero');
      final retorno = response.data;
      return retorno;
    } catch (e) {
      throw Exception(e);
    }
  }
}
