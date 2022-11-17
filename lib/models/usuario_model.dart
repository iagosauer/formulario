import 'dart:convert';

class UsuarioModel {
  final int codigo;
  final String login;

  UsuarioModel({required this.codigo, required this.login});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'login': login,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      codigo: map['codigo'] as int,
      login: map['login'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
