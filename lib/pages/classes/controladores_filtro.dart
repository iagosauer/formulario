import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/Utils.dart';


class ControladoresFiltro {
  ControladoresFiltro();
  var controlerDataInicial = TextEditingController(text: Utils().DataHoje());
  var controlerDataFinal = TextEditingController(text: Utils().DataHoje());
  var controlerCodigoManejo = TextEditingController();
  var controlerHabilitadoCodigo = ValueNotifier(true);
}
