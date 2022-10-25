import 'package:dio/dio.dart';
import 'package:forms/widgets/valores.dart';
import '../models/pecuaria_model.dart';

class PecuariaRepository {
  final dio = Dio();
  final baseUrl = Valor.baseUrl;

  Future<List<PecuariaModel>> fetchPecuaria() async {
    print('aqui');
    final response = await dio.get('$baseUrl/tipo_pecuaria');
    final lista = response.data as List;
    print('aqui de novo');
    print(lista);
    return lista.map((e) => PecuariaModel.fromMap(e)).toList();
  }
}
