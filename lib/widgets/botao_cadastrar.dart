import 'package:flutter/material.dart';
import 'package:forms/widgets/valores.dart';

import '../pages/classes/classe_manejo.dart';
import '../pages/classes/controladores.dart';

class CustomBotaoCadastrar extends StatelessWidget {
  Controladores controladores;
  CustomBotaoCadastrar({required this.controladores});

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
        onPressed: () {
          Manejo manejo = Manejo(
              data: controladores.controlerDate.text,
              finalidade: controladores.controlerFinalidade.value,
              idade: int.parse(controladores.controlerIdade.text),
              motivo: controladores.controlerMotivo.value,
              pecuaria: controladores.controlerTipo.value,
              propriedade: controladores.controlerFazenda.value,
              quantidade: int.parse(controladores.controlerQuantidade.text),
              sexo: controladores.controlerSexo.value,
              tipo: controladores.controlerTipo.value);
          print(manejo.motivo);
        },
        child: const Text('Cadastrar'),
      ),
    );
  }
}
