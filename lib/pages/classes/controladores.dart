import 'package:flutter/material.dart';
import 'package:forms/models/finalidade_model.dart';
import 'package:forms/models/pecuaria_model.dart';
import 'package:forms/Auxiliares/Utils.dart';

import '../../models/propriedade_model.dart';

class Controladores {
  var controlerDate = TextEditingController(text: Utils().DataHoje());
  var controlerFazenda = ValueNotifier<PropriedadeModel>(PropriedadeModel(
    codigo: 0,
    nome: '',
  ));
  var controlerTipo = ValueNotifier<PecuariaModel>(PecuariaModel(
    codigo: 0,
    descricao: '',
  ));
  var controlerFinalidade =
      ValueNotifier<FinalidadeModel>(FinalidadeModel(codigo: 0, descricao: ''));
  var controlerEntradaSaida = ValueNotifier('');
  var controlerMotivo = ValueNotifier('');
  var controlerIdade = TextEditingController();
  var controlerSexo = ValueNotifier('');
  var controlerQuantidade = TextEditingController();
  var controlerValidadorIdade = ValueNotifier(true);
  var controlerValidadorQuantidade = ValueNotifier(true);
  var controlerValidadorData = ValueNotifier(true);
  var updateScreen = ValueNotifier(false);

  Controladores();
}
