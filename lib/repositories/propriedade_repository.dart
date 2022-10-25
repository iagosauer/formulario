import 'package:dio/dio.dart';
import 'package:forms/models/propriedade_model.dart';
import 'package:forms/widgets/valores.dart';

class PropriedadeRepository {
  final dio = Dio();
  final baseUrl = Valor.baseUrl;

  Future<List<PropriedadeModel>> fetchProprietario() async {
    final response = await dio.get('$baseUrl/propriedade');
    final lista = response.data as List;
    return lista.map((e) => PropriedadeModel.fromMap(e)).toList();
  }
}
