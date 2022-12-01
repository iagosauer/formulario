import 'package:flutter/material.dart';
import 'package:forms/models/manejo_model.dart';
import 'package:forms/pages/form_manejo.dart';
import 'package:forms/pages/lista_manejos.dart';
import 'package:forms/repositories/codigoManejo_repository.dart';
import 'package:forms/repositories/manejo_repository.dart';
import 'package:forms/repositories/saldo_repository.dart';
import 'package:forms/widgets/janelaDialog.dart';
import 'package:forms/Auxiliares/valores.dart';
import 'package:brasil_fields/brasil_fields.dart';
import '../models/propriedade_model.dart';
import '../pages/classes/controladores.dart';
import 'dialog_propriedades_destino.dart';

class CustomBotaoFiltrar extends StatefulWidget {

  CustomBotaoFiltrar(
      {super.key,});

  @override
  State<CustomBotaoFiltrar> createState() => _CustomBotaoCadastrarState();
}

class _CustomBotaoCadastrarState extends State<CustomBotaoFiltrar> {
  bool validador = false;
  final ValueNotifier<PropriedadeModel> controladorDestino = ValueNotifier<PropriedadeModel>(PropriedadeModel(
    codigo: 0,
    nome: '',
  ),);




  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(2 * Valor.radiusCircular),
        ),
      ),
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () async {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  ListaManejos(),
        ),
      );
        },
        child: const Text('Buscar'),
      ),
    );
  }
}
