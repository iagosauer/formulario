import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forms/widgets/text_field.dart';

import '../widgets/botao_cadastrar.dart';
import '../widgets/drop_down_button.dart';
import '../widgets/drop_down_button_Entrada_Saida.dart';
import '../widgets/text_label.dart';
import '../widgets/valores.dart';
import 'classes/controladores.dart';

class FormManejo extends StatelessWidget {
  String title;
  Controladores controladores = Controladores();

  List<String> ListaPropriedades = <String>[
    'Fazenda Barão',
    'Fazenda Bom Jesus',
    'Fazenda Boi Bravo'
  ];
  List<String> ListaTipoPecuaria = <String>['Bovino', 'Suíno', 'Equino'];
  List<String> ListaFinalidade = <String>['Corte', 'Leiteira'];
  List<String> ListaEntradaSaida = <String>['Entrada', 'Saida'];
  List<String> ListaMotivosEntrada = <String>['Compra', 'Nascimento'];
  List<String> ListaMotivosSaida = <String>[
    'Venda',
    'Transferência',
    'Morte',
    'Abate'
  ];
  List<String> ListaMotivos = <String>[
    'Venda',
    'Transferência',
    'Morte',
    'Abate'
  ];

  List<String> ListaSexo = <String>['Macho', 'Fêmea'];

  FormManejo({Key? key, this.title: ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextLabel(texto: 'Data'),
              CustomTextField(
                controler: controladores.controlerDate,
                labelHint: 'Data',
                icon: Icons.calendar_month,
                data: true,
              ),
              CustomTextLabel(texto: 'Propriedade'),
              CustomDropDownButtonForm(
                list: ListaPropriedades,
                controler: controladores.controlerFazenda,
                icon: Icons.home,
              ),
              CustomTextLabel(texto: 'Tipo Pecuária'),
              CustomDropDownButtonForm(
                list: ListaTipoPecuaria,
                controler: controladores.controlerTipo,
                icon: Icons.pets,
              ),
              CustomTextLabel(texto: 'Finalidade'),
              CustomDropDownButtonForm(
                list: ListaFinalidade,
                controler: controladores.controlerFinalidade,
                icon: Icons.list,
              ),
              CustomTextLabel(texto: 'Tipo E/S'),
              CustomDropDownButtonForm(
                list: ListaEntradaSaida,
                controler: controladores.controlerEntradaSaida,
                icon: Icons.transit_enterexit,
              ),
              CustomTextLabel(texto: 'Motivo'),
              ValueListenableBuilder<String>(
                  valueListenable: controladores.controlerEntradaSaida,
                  builder: (context, entraSaida, _) {
                    if (entraSaida == 'Entrada') {
                      ListaMotivos = ListaMotivosEntrada;
                    } else {
                      ListaMotivos = ListaMotivosSaida;
                    }
                    controladores.controlerMotivo.value = ListaMotivos[0];
                    return CustomDropDownButtonForm(
                      list: ListaMotivos,
                      controler: controladores.controlerMotivo,
                      icon: Icons.abc,
                    );
                  }),
              CustomTextLabel(texto: 'Idade (meses)'),
              CustomTextField(
                controler: controladores.controlerIdade,
                labelHint: 'Idade',
                icon: Icons.calendar_view_month,
                inteiro: true,
              ),
              CustomTextLabel(texto: 'Sexo'),
              CustomDropDownButtonForm(
                list: ListaSexo,
                controler: controladores.controlerSexo,
                icon: Icons.male,
              ),
              CustomTextLabel(texto: 'Quantidade'),
              CustomTextField(
                controler: controladores.controlerQuantidade,
                labelHint: 'Quantidade',
                icon: Icons.numbers,
                inteiro: true,
              ),
              const SizedBox(
                height: Valor.distancia,
              ),
              CustomBotaoCadastrar(controladores: controladores),
            ],
          ),
        ),
      ),
    );
  }
}
