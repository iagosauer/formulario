import 'package:flutter/material.dart';
import 'package:forms/models/finalidade_model.dart';
import 'package:forms/models/pecuaria_model.dart';
import 'package:forms/Auxiliares/Utils.dart';
import 'package:forms/widgets/menu_appbar.dart';
import '../../models/propriedade_model.dart';

class Controladores {
  static final Controladores _instance = Controladores._();

  static Controladores get getInstance => _instance;

  final controlerDate = TextEditingController(text: Utils().DataHoje());
  final controlerFazenda = ValueNotifier<PropriedadeModel>(PropriedadeModel(
    codigo: 0,
    nome: '',
  ),);
  final controlerTipo = ValueNotifier<PecuariaModel>(PecuariaModel(
    codigo: 0,
    descricao: '',
  ),);
  final controlerFinalidade =
      ValueNotifier<FinalidadeModel>(FinalidadeModel(codigo: 0, descricao: ''));
  final controlerEntradaSaida = ValueNotifier('');
  final controlerMotivo = ValueNotifier('');
  final controlerIdade = TextEditingController();
  final controlerSexo = ValueNotifier('');
  final controlerQuantidade = TextEditingController();
  final controlerValidadorIdade = ValueNotifier(true);
  final controlerValidadorQuantidade = ValueNotifier(true);
  final controlerValidadorData = ValueNotifier(true);
  final updateScreen = ValueNotifier(false);
  final controlerFazendaDestino = ValueNotifier<PropriedadeModel>(PropriedadeModel(
    codigo: 0,
    nome: '',
  ),);
 late ValueNotifier<ItensDeMenu> selectedMenu = ValueNotifier(ItensDeMenu.controlar);

  Controladores._();
}
