import 'package:flutter/material.dart';
import 'package:forms/models/finalidade_model.dart';
import 'package:forms/models/pecuaria_model.dart';
import 'package:forms/Auxiliares/Utils.dart';

import '../../models/propriedade_model.dart';

class Controladores {
  final controlerDate = TextEditingController(text: Utils().DataHoje());
  final controlerFazenda = ValueNotifier<PropriedadeModel>(PropriedadeModel(
    codigo: 0,
    nome: '',
  ));
  final controlerTipo = ValueNotifier<PecuariaModel>(PecuariaModel(
    codigo: 0,
    descricao: '',
  ));
  final controlerFinalidade =
      ValueNotifier<FinalidadeModel>(FinalidadeModel(codigo: 0, descricao: ''));
  final controlerEntradaSaida = ValueNotifier('');
  final controlerMotivo = ValueNotifier('');
  final controlerIdade = TextEditingController();
  final controlerSexo = ValueNotifier('');
  final controlerQuantidade = TextEditingController();
  Controladores() {}
}
