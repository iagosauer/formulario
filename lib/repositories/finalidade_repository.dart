import 'dart:developer';

import 'package:forms/Auxiliares/valores.dart';
import '../models/finalidade_model.dart';
import '../models/pecuaria_model.dart';
import 'package:dio/dio.dart';

class FinalidadeRepository {
  final dio = Dio();

  Future<List<FinalidadeModel>> fetchFinalidade() async {
    try {
      final response = await dio.get('${Valor.baseUrl}/finalidade');
      final lista = response.data as List;
      log(lista.toString());
      return lista.map((e) => FinalidadeModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
