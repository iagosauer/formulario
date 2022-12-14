import 'package:forms/models/manejo_model.dart';
import 'package:forms/Auxiliares/Valores.dart';
import 'package:dio/dio.dart';
import 'package:forms/models/manejo_recebe_model.dart';

class ManejoRepository {
  final dio = Dio();

  Future<bool> fetchManejo(ManejoModel manejo) async {
    try {
      final response =
          await dio.post('${Valor.baseUrl}/manejo', data: manejo.toMap());
      return response.statusCode == 200;
    } catch (e) {
      throw Exception(e);
    }
  }

    Future<List<ManejoRecebeModel>> fetchManejoEntreDatas(String data1, String data2) async {
    try {
      final response = await dio.get('${Valor.baseUrl}/manejo?total=100&data1=$data1&data2=$data2');
      final lista = response.data as List;
      return lista.map((e) => ManejoRecebeModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ManejoRecebeModel>> fetchTodosManejos() async {
    try {
      final response = await dio.get('${Valor.baseUrl}/manejo?total=100');
      final lista = response.data as List;
      return lista.map((e) => ManejoRecebeModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
