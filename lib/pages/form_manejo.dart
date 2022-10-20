import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forms/widgets/text_field.dart';

import '../widgets/drop_down_button.dart';
import '../widgets/text_label.dart';
import '../widgets/valores.dart';

class FormManejo extends StatelessWidget {
  String title;
  final controlerDate = TextEditingController();
  final controlerFazenda = ValueNotifier('');
  final controlerTipo = ValueNotifier('');
  final controlerFinalidade = ValueNotifier('');
  final controlerEntradaSaida = ValueNotifier('');
  final controlerMotivo = ValueNotifier('');
  final controlerIdade = TextEditingController();
  final controlerSexo = ValueNotifier('');
  final controlerQuantidade = TextEditingController();

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
                controler: controlerDate,
                labelHint: 'Data',
                icon: Icons.calendar_month,
                data: true,
              ),
              CustomTextLabel(texto: 'Propriedade'),
              CustomDropDownButtonForm(
                list: ListaPropriedades,
                controler: controlerFazenda,
                icon: Icons.home,
              ),
              CustomTextLabel(texto: 'Tipo Pecuária'),
              CustomDropDownButtonForm(
                list: ListaTipoPecuaria,
                controler: controlerTipo,
                icon: Icons.pets,
              ),
              CustomTextLabel(texto: 'Finalidade'),
              CustomDropDownButtonForm(
                list: ListaFinalidade,
                controler: controlerFinalidade,
                icon: Icons.list,
              ),
              CustomTextLabel(texto: 'Tipo E/S'),
              CustomDropDownButtonForm(
                list: ListaEntradaSaida,
                controler: controlerEntradaSaida,
                icon: Icons.transit_enterexit,
              ),
              CustomTextLabel(texto: 'Motivo'),
              CustomDropDownButtonForm(
                list: ListaMotivos,
                controler: controlerMotivo,
                icon: Icons.abc,
              ),
              CustomTextLabel(texto: 'Idade (meses)'),
              CustomTextField(
                controler: controlerIdade,
                labelHint: 'Idade',
                icon: Icons.calendar_view_month,
                inteiro: true,
              ),
              CustomTextLabel(texto: 'Sexo'),
              CustomDropDownButtonForm(
                list: ListaSexo,
                controler: controlerSexo,
                icon: Icons.male,
              ),
              CustomTextLabel(texto: 'Quantidade'),
              CustomTextField(
                controler: controlerQuantidade,
                labelHint: 'Quantidade',
                icon: Icons.numbers,
                inteiro: true,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Valor.radiusCircular),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {},
                  child: const Text('Enabled'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
