import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forms/models/manejo_model.dart';
import 'package:forms/repositories/manejo_repository.dart';
import 'package:forms/widgets/janelaDialog.dart';
import 'package:forms/Auxiliares/valores.dart';
import 'package:brasil_fields/brasil_fields.dart';
import '../pages/classes/controladores.dart';

class CustomBotaoCadastrar extends StatelessWidget {
  Controladores controladores;
  CustomBotaoCadastrar({required this.controladores});

  void _enviarDados(ManejoModel manejo, BuildContext context) async {
    ManejoRepository manejoRepository = new ManejoRepository();
    bool retorno = await manejoRepository.fetchManejo(manejo);
    if (retorno) {
      await JanelaDialog(
              mensagem: 'Manejo salvo com Sucesso!', mensagemTrue: 'Ok')
          .build(context);
    } else {
      await JanelaDialog(
              mensagem: 'Não foi possível realizar o cadastro!',
              mensagemTrue: 'Ok')
          .build(context);
    }
  }

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
          try {
            var data = UtilData.obterDateTime(controladores.controlerDate.text)
                .toString();
            DateTime.parse(data);
            UtilData.validarData(data);
            ManejoModel manejo = ManejoModel(
                data: data,
                codFinalidade: 1, //controladores.controlerFinalidade.value,
                idade: int.parse(controladores.controlerIdade.text),
                motivos: controladores.controlerMotivo.value,
                codTipoPecuaria: controladores.controlerTipo.value.codigo,
                codPropriedade: controladores.controlerFazenda.value.codigo,
                quantidade: int.parse(controladores.controlerQuantidade.text),
                sexo: controladores.controlerSexo.value,
                tipoOperacao: controladores.controlerEntradaSaida.value,
                codigo: 1,
                propriedadeDestino: 1);
            final valor = await const JanelaDialog(
                    mensagem: 'Tem certeza que deseja cadastrar o Manejo ?',
                    mensagemTrue: 'Sim',
                    mensagemFalse: 'Não')
                .build(context);
            if (valor) {
              _enviarDados(manejo, context);
            }
          } catch (e) {
            var mensagemErro = e.toString();
            if (mensagemErro.compareTo(
                    "Expected a value of type 'String', but got one of type 'DateTime'") ==
                0) {
              mensagemErro = 'Data Inválida!';
            }
            await JanelaDialog(mensagem: mensagemErro, mensagemTrue: 'OK')
                .build(context);
          }
        },
        child: const Text('Cadastrar'),
      ),
    );
  }
}
