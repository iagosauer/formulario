import 'dart:convert';

class PropriedadeModel {
  final int codigo;
  final String nome;

  PropriedadeModel({required this.codigo, required this.nome});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'nome': nome,
    };
  }

  factory PropriedadeModel.fromMap(Map<String, dynamic> map) {
    return PropriedadeModel(
      codigo: map['codigo'] as int,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropriedadeModel.fromJson(String source) =>
      PropriedadeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
