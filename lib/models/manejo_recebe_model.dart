// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ManejoRecebeModel {
  final int? codigo;
  final String? data;
  final String? codPropriedade;
  final int? codTipoPecuaria;
  final int? codFinalidade;
  final String? tipoOperacao;
  final String? motivos;
  final int? idade;
  final String? sexo;
  final int? quantidade;
  int? propriedadeDestino;

  ManejoRecebeModel({
    this.codigo,
    this.data,
    this.codPropriedade,
    this.codTipoPecuaria,
    this.codFinalidade,
    this.tipoOperacao,
    this.motivos,
    this.idade,
    this.sexo,
    this.quantidade,
    this.propriedadeDestino,
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

  factory ManejoRecebeModel.fromMap(Map<String, dynamic> map) {
    return ManejoRecebeModel(
      codigo: map['codigo'] as int?,
      data: map['data'] as String?,
      codPropriedade: map['propriedade'] as String?,
      codTipoPecuaria: map['tipopecuaria'] as int?,
      codFinalidade: map['finalidade'] as int?,
      tipoOperacao: map['tipooperacao'] as String?,
      motivos: map['motivos'] as String?,
      idade: map['idade'] as int?,
      sexo: map['sexo'] as String?,
      quantidade: map['quantidade'] as int?,
      propriedadeDestino: map['propriedadeDestino'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ManejoRecebeModel.fromJson(String source) =>
      ManejoRecebeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
