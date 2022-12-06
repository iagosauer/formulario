import 'package:forms/Auxiliares/Valores.dart';
import 'package:dio/dio.dart';

class SaldoRepository {
  final dio = Dio();

  Future<int> fetchSaldo(
      {required int propriedade,
      required String sexo,
      required int tipoPecuaria,
      required int idade}) async {
    try {
      final response = await dio.post(
        '${Valor.baseUrl}/saldo_animal',
        data: _saldoToMap(propriedade, sexo, tipoPecuaria, idade),
      );
      return response.data['saldo'] as int;
    } catch (e) {
      throw Exception(e);
    }
  }

  Map<String, dynamic> _saldoToMap(
      int propriedade, String sexo, int tipoPecuaria, int idade) {
    return <String, dynamic>{
      'propriedade': propriedade,
      'sexo': sexo,
      'tipo_pecuaria': tipoPecuaria,
      'idade': idade
    };
  }
}
