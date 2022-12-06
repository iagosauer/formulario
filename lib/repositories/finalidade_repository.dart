import 'package:forms/Auxiliares/valores.dart';
import '../models/finalidade_model.dart';
import 'package:dio/dio.dart';

class FinalidadeRepository {
  final dio = Dio();

  Future<List<FinalidadeModel>> fetchFinalidade() async {
    try {
      final response = await dio.get('${Valor.baseUrl}/finalidade');
      final lista = response.data as List;
      return lista.map((e) => FinalidadeModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<FinalidadeModel> fetchUmaFinalidade(String valor) async {
    try {
      final response = await dio.get('${Valor.baseUrl}/finalidade/$valor');
      final retorno = FinalidadeModel.fromMap(response.data);
      return retorno;
    } catch (e) {
      throw Exception(e);
    }
  }
}
