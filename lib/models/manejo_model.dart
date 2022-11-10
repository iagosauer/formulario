// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ManejoModel {
  final int codigo;
  final String data;
  final int codPropriedade;
  final int codTipoPecuaria;
  final int codFinalidade;
  final String tipoOperacao;
  final String motivos;
  final int idade;
  final String sexo;
  final int quantidade;
  final int propriedadeDestino;

  ManejoModel({
    required this.codigo,
    required this.data,
    required this.codPropriedade,
    required this.codTipoPecuaria,
    required this.codFinalidade,
    required this.tipoOperacao,
    required this.motivos,
    required this.idade,
    required this.sexo,
    required this.quantidade,
    required this.propriedadeDestino,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'data': data,
      'codPropriedade': codPropriedade,
      'codTipoPecuaria': codTipoPecuaria,
      'codFinalidade': codFinalidade,
      'tipoOperacao': tipoOperacao,
      'motivos': motivos,
      'idade': idade,
      'sexo': sexo,
      'quantidade': quantidade,
      'propriedadeDestino': propriedadeDestino,
    };
  }

  factory ManejoModel.fromMap(Map<String, dynamic> map) {
    return ManejoModel(
      codigo: map['codigo'] as int,
      data: map['data'] as String,
      codPropriedade: map['codPropriedade'] as int,
      codTipoPecuaria: map['codTipoPecuaria'] as int,
      codFinalidade: map['codFinalidade'] as int,
      tipoOperacao: map['tipoOperacao'] as String,
      motivos: map['motivos'] as String,
      idade: map['idade'] as int,
      sexo: map['sexo'] as String,
      quantidade: map['quantidade'] as int,
      propriedadeDestino: map['propriedadeDestino'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ManejoModel.fromJson(String source) =>
      ManejoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
