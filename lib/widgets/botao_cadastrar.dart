import 'package:flutter/material.dart';
import 'package:forms/models/manejo_model.dart';
import 'package:forms/pages/form_manejo.dart';
import 'package:forms/pages/home_page.dart';
import 'package:forms/repositories/codigoManejo_repository.dart';
import 'package:forms/repositories/manejo_repository.dart';
import 'package:forms/repositories/saldo_repository.dart';
import 'package:forms/widgets/janelaDialog.dart';
import 'package:forms/Auxiliares/valores.dart';
import 'package:brasil_fields/brasil_fields.dart';
import '../pages/classes/controladores.dart';

class CustomBotaoCadastrar extends StatefulWidget {
  Controladores controladores;
  GlobalKey<FormState> formKey;
  CustomBotaoCadastrar(
      {super.key, required this.controladores, required this.formKey});

  @override
  State<CustomBotaoCadastrar> createState() => _CustomBotaoCadastrarState();
}

class _CustomBotaoCadastrarState extends State<CustomBotaoCadastrar> {
  bool validador = false;

  _enviarDados(ManejoModel manejo, BuildContext context) async {
    ManejoRepository manejoRepository = ManejoRepository();
    bool retorno = await manejoRepository.fetchManejo(manejo);
    if (retorno) {
      // ignore: use_build_context_synchronously
      await JanelaDialog(
              mensagem: 'Manejo salvo com Sucesso!', mensagemTrue: 'Ok')
          .build(context);
      widget.controladores.updateScreen.value = true;
    } else {
      // ignore: use_build_context_synchronously
      await JanelaDialog(
              mensagem: 'Não foi possível realizar o cadastro!',
              mensagemTrue: 'Ok')
          .build(context);
    }
    return retorno;
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
          var data =
              UtilData.obterDateTime(widget.controladores.controlerDate.text)
                  .toString();
          if (widget.formKey.currentState!.validate()) {
            validador = true;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processando dados!')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Dados Incorretos!')),
            );
            validador = false;
          }

          ManejoModel manejo = ManejoModel(
              codigo: await CodigoRepository().fetchCodigo(),
              data: data,
              codFinalidade: 1, //controladores.controlerFinalidade.value,
              idade: int.parse(widget.controladores.controlerIdade.text),
              motivos: widget.controladores.controlerMotivo.value,
              codTipoPecuaria: widget.controladores.controlerTipo.value.codigo,
              codPropriedade:
                  widget.controladores.controlerFazenda.value.codigo,
              quantidade:
                  int.parse(widget.controladores.controlerQuantidade.text),
              sexo: widget.controladores.controlerSexo.value,
              tipoOperacao: widget.controladores.controlerEntradaSaida.value,
              propriedadeDestino: 1);
          var saldo = await SaldoRepository().fetchSaldo(
              propriedade: manejo.codPropriedade,
              idade: manejo.idade,
              sexo: manejo.sexo,
              tipoPecuaria: manejo.codTipoPecuaria);
          if ((saldo < manejo.quantidade) &&
              (manejo.tipoOperacao.compareTo('SAÍDA') == 0)) {
            validador = false;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('O valor da quantidade está acima do saldo!')),
            );
          }
          if (validador) {
            // ignore: use_build_context_synchronously
            final valor = await JanelaDialog(
                    mensagem: 'Tem certeza que deseja cadastrar o Manejo ?',
                    mensagemTrue: 'Sim',
                    mensagemFalse: 'Não')
                .build(context);
            if (valor) {
              if (await _enviarDados(manejo, context)) {
                context
                    .findAncestorWidgetOfExactType<FormManejo>()
                    ?.createState()
                    .build(context);
              }
            }
          }
        },
        child: const Text('Salvar'),
      ),
    );
  }
}
