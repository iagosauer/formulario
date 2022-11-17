import 'package:forms/Auxiliares/valores.dart';
import 'package:forms/models/usuario_model.dart';
import 'package:dio/dio.dart';

class UsuarioRepository {
  final dio = Dio();

  Future<List<UsuarioModel>> fetchUsuario() async {
    try {
      final response = await dio.get('${Valor.baseUrl}/usuarios');
      final lista = response.data as List;
      return lista.map((e) => UsuarioModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
