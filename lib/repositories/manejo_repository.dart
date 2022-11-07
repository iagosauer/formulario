import 'dart:developer';

import 'package:forms/models/manejo_model.dart';
import 'package:forms/widgets/valores.dart';
import '../models/pecuaria_model.dart';
import 'package:dio/dio.dart';

class ManejoRepository {
  final dio = Dio();

  Future<bool> fetchManejo(ManejoModel manejo) async {
    try {
      final response = await dio.post('${Valor.baseUrl}/manejo', data: manejo.toMap());
      return response.statusCode == 200;
    } catch (e) {
      throw Exception(e);
    }
  }
}
