import 'dart:convert';

class FinalidadeModel {
  int codigo;
  String descricao;

  FinalidadeModel({required this.codigo, required this.descricao});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'descricao': descricao,
    };
  }

  factory FinalidadeModel.fromMap(Map<String, dynamic> map) {
    return FinalidadeModel(
      codigo: map['codigo'] as int,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FinalidadeModel.fromJson(String source) =>
      FinalidadeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
