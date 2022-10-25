import 'package:flutter/material.dart';
import 'package:forms/models/propriedade_model.dart';
import 'package:forms/widgets/text_field.dart';
import '../repositories/pecuaria_repository.dart';
import '../repositories/propriedade_repository.dart';
import '../widgets/botao_cadastrar.dart';
import '../widgets/drop_down_button.dart';
import '../widgets/text_label.dart';
import '../widgets/valores.dart';
import 'classes/controladores.dart';

class FormManejo extends StatefulWidget {
  String title;

  FormManejo({Key? key, this.title: ''}) : super(key: key);

  @override
  State<FormManejo> createState() => _FormManejoState();
}

class _FormManejoState extends State<FormManejo> {
  Controladores controladores = Controladores();
  bool carregando = false;

  final repositoryPropriedade = PropriedadeRepository();
  final repositoryPecuaria = PecuariaRepository();
  List<String> ListaPropriedades = <String>[];
  List<String> ListaTipoPecuaria = <String>[];

  @override
  initState() {
    super.initState();
    setState(() {
      carregando = true;
    });
    repositoryPecuaria.fetchPecuaria().then(
      (value) {
        ListaTipoPecuaria.clear();
        ListaTipoPecuaria = value.map((e) => e.descricao).toList();
      },
    );
    repositoryPropriedade.fetchProprietario().then(
      (value) {
        ListaPropriedades.clear();
        ListaPropriedades = value.map((e) => e.nome).toList();
        setState(
          () {
            print('aqui');
            carregando = false;
          },
        );
      },
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : _Sucesso(),
    );
  }

  SingleChildScrollView _Sucesso() {
    return SingleChildScrollView(
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
    );
  }
}



/*
                FutureBuilder<List<ProrpiedadeModel>>(
                  future: repositoryPropriedade.fetchProprietario(),
                  builder: (context, snapShot) {
                    if (snapShot.hasData &&
                        snapShot.connectionState == ConnectionState.done) {
                      ListaPropriedades.clear();
                      ListaPropriedades =
                          snapShot.data!.map((e) => e.nome).toList();
                      return CustomDropDownButtonForm(
                        list: ListaPropriedades,
                        controler: controladores.controlerFazenda,
                        icon: Icons.home,
                      );
                    }
                    if (snapShot.hasError) {
                      return const Text("Erro ao buscar a propriedade");
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),

*/