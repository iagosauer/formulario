// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PecuariaModel {
  final int codigo;
  final String descricao;

  PecuariaModel({required this.codigo, required this.descricao});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'descricao': descricao,
    };
  }

  factory PecuariaModel.fromMap(Map<String, dynamic> map) {
    return PecuariaModel(
      codigo: map['codigo'] as int,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PecuariaModel.fromJson(String source) =>
      PecuariaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
