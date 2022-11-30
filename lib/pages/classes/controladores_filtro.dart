import 'package:flutter/material.dart';
import 'package:forms/models/finalidade_model.dart';
import 'package:forms/models/pecuaria_model.dart';
import 'package:forms/Auxiliares/Utils.dart';
import 'package:forms/widgets/menu_appbar.dart';

import '../../models/propriedade_model.dart';

class ControladoresFiltro {
  var controlerDate = TextEditingController(text: Utils().DataHoje());
  var controlerFinalidade =
      ValueNotifier<FinalidadeModel>(FinalidadeModel(codigo: 0, descricao: ''));
  var controlerEntradaSaida = ValueNotifier('');
  var controlerMotivo = ValueNotifier('');
  var controlerSexo = ValueNotifier('');
  var controlerFazendaDestino = ValueNotifier<PropriedadeModel>(PropriedadeModel(
    codigo: 0,
    nome: '',
  ),);
 late ValueNotifier<ItensDeMenu> selectedMenu = ValueNotifier(ItensDeMenu.controlar);

  ControladoresFiltro();
  var controlerCodigoManejo = TextEditingController();
  var controlerHabilitadoCodigo = ValueNotifier(true);
}
