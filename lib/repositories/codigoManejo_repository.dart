// ignore: file_names
import 'package:forms/Auxiliares/valores.dart';
import 'package:dio/dio.dart';

class CodigoRepository {
  final dio = Dio();

  Future<int> fetchCodigo() async {
    try {
      final response = await dio.post(
        '${Valor.baseUrl}/gera_codigo',
        data: _codToMap(),
      );
      return response.data['codigo'] as int;
    } catch (e) {
      throw Exception(e);
    }
  }

  Map<String, dynamic> _codToMap() {
    return <String, dynamic>{"tabela": "MANEJO_ANIMAL", "campo": "MAN_CODIGO"};
  }
}
