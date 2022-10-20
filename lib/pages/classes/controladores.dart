import 'package:flutter/material.dart';

class Controladores {
  final controlerDate = TextEditingController();
  final controlerFazenda = ValueNotifier('');
  final controlerTipo = ValueNotifier('');
  final controlerFinalidade = ValueNotifier('');
  final controlerEntradaSaida = ValueNotifier('');
  final controlerMotivo = ValueNotifier('');
  final controlerIdade = TextEditingController();
  final controlerSexo = ValueNotifier('');
  final controlerQuantidade = TextEditingController();
  Controladores() {}
}
