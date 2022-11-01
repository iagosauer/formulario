import 'package:dio/dio.dart';
import 'package:forms/models/propriedade_model.dart';
import 'package:forms/widgets/valores.dart';

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
}
