import 'package:flutter/material.dart';
import 'package:forms/models/finalidade_model.dart';
import 'package:forms/models/pecuaria_model.dart';
import 'package:forms/Auxiliares/Utils.dart';
import 'package:forms/widgets/menu_appbar.dart';

import '../../models/propriedade_model.dart';

class ControladoresFiltro {
  ControladoresFiltro();
  var controlerDataInicial = TextEditingController(text: Utils().DataHoje());
  var controlerDataFinal = TextEditingController(text: Utils().DataHoje());
  var controlerCodigoManejo = TextEditingController();
  var controlerHabilitadoCodigo = ValueNotifier(true);
}
