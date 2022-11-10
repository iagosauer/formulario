import 'package:forms/Auxiliares/valores.dart';
import '../models/pecuaria_model.dart';
import 'package:dio/dio.dart';

class PecuariaRepository {
  final dio = Dio();

  Future<List<PecuariaModel>> fetchPecuaria() async {
    try {
      final response = await dio.get('${Valor.baseUrl}/tipo_pecuaria');
      final lista = response.data as List;
      return lista.map((e) => PecuariaModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
