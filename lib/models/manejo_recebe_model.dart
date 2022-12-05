// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:forms/models/finalidade_model.dart';
import 'package:forms/models/pecuaria_model.dart';
import 'package:forms/models/propriedade_model.dart';

class ManejoRecebeModel {
  final int? codigo;
  final String? data;
  final int? codPropriedade;
  final int? codTipoPecuaria;
  final int? codFinalidade;
  final String? tipoOperacao;
  final String? motivos;
  final int? idade;
  final String? sexo;
  final int? quantidade;
  int? propriedadeDestino;
  final PecuariaModel? pecuariaModel;
  final FinalidadeModel? finalidadeModel;
  final PropriedadeModel? propriedadeModel;

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
    this.pecuariaModel,
    this.finalidadeModel,
    this.propriedadeModel
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
      'tipoPecuaria' : pecuariaModel,
      'finalidade' : finalidadeModel,
      'propriedade' : propriedadeModel
    };
  }

  factory ManejoRecebeModel.fromMap(Map<String, dynamic> map) {
    return ManejoRecebeModel(
      codigo: map['codigo'] as int?,
      data: map['data'] as String?,
      codPropriedade: map['codPropriedade'] as int?,
      codTipoPecuaria: map['codTipoPecuaria'] as int?,
      codFinalidade: map['codFinalidade'] as int?,
      tipoOperacao: map['tipoOperacao'] as String?,
      motivos: map['motivos'] as String?,
      idade: map['idade'] as int?,
      sexo: map['sexo'] as String?,
      quantidade: map['quantidade'] as int?,
      propriedadeDestino: map['propriedadeDestino'] as int?,
      pecuariaModel: PecuariaModel.fromMap(map['tipoPecuaria']),
      finalidadeModel: FinalidadeModel.fromMap(map['finalidade']),
      propriedadeModel: PropriedadeModel.fromMap(map['propriedade']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ManejoRecebeModel.fromJson(String source) =>
      ManejoRecebeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
