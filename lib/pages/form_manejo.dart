// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:forms/models/finalidade_model.dart';
import 'package:forms/models/pecuaria_model.dart';
import 'package:forms/models/propriedade_model.dart';
import 'package:forms/pages/classes/lotties.dart';
import 'package:forms/pages/classes/navegacao.dart';
import 'package:forms/pages/lista_manejos.dart';
import 'package:forms/repositories/finalidade_repository.dart';
import 'package:forms/widgets/menu_appbar.dart';
import 'package:forms/widgets/text_field.dart';
import '../Auxiliares/Utils.dart';
import '../repositories/pecuaria_repository.dart';
import '../repositories/propriedade_repository.dart';
import '../widgets/botao_cadastrar.dart';
import '../widgets/drop_down_button.dart';
import '../widgets/text_label.dart';
import '../Auxiliares/valores.dart';
import 'classes/controladores.dart';

// ignore: must_be_immutable
class FormManejo extends StatefulWidget {
  String title;

  FormManejo({Key? key, this.title: ''}) : super(key: key);

  @override
  State<FormManejo> createState() => _FormManejoState();
}

class _FormManejoState extends State<FormManejo> {
  Controladores controladores = Controladores();
  bool carregando = false;
  bool erro = false;

  final repositoryPropriedade = PropriedadeRepository();
  final repositoryPecuaria = PecuariaRepository();
  final repositoryFinalidade = FinalidadeRepository();
  var listaPropriedades = <PropriedadeModel>[];
  var listaTipoPecuaria = <PecuariaModel>[];
  var listaFinalidade = <FinalidadeModel>[];
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    controladores.selectedMenu.addListener(
        () => Navegacao(controladores.selectedMenu, context).acoesDeMenu());
    controladores.updateScreen.addListener(
      () => _buscarDados(),
    );
    _buscarDados();
  }

  List<String> ListaEntradaSaida = <String>[];

  List<String> ListaMotivosEntrada = <String>[];

  List<String> ListaMotivosSaida = <String>[];

  List<String> ListaMotivos = <String>[];

  List<String> ListaSexo = <String>[];

  // ignore: unused_element
  _acoesDeMenu() {
    bool x = true;
    if (controladores.selectedMenu.value == ItensDeMenu.cadastrar) {
      _buscarDados();
    } else {
      x = false;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ListaManejos(),
        ),
      );
    }
    x ? controladores.selectedMenu.value = ItensDeMenu.controlar : null;
  }

  Future _buscarDados() async {
    try {
      setState(() {
        carregando = true;
      });
      listaTipoPecuaria = await repositoryPecuaria.fetchPecuaria();
      listaPropriedades = await repositoryPropriedade.fetchProprietario();
      listaFinalidade = await repositoryFinalidade.fetchFinalidade();
      setState(() {
        carregando = false;
      });
    } catch (e) {
      setState(() {
        erro = true;
        carregando = false;
      });
    }
    _adcionaValores();
    _reiniciaControladores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        MenuAppBar(selectedMenu: controladores.selectedMenu).build(context),
      ]),
      body: carregando
          ? Center(child: Lotties.aminalLoading())
          : erro
              ? Valor.buildErro(context)
              : _Sucesso(),
    );
  }


  SingleChildScrollView _Sucesso() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextLabel(texto: 'Data'),
              CustomTextField(
                controler: controladores.controlerDate,
                icon: Icons.calendar_month,
                data: true,
              ),
              CustomTextLabel(texto: 'Propriedade'),
              CustomDropDownButtonForm<PropriedadeModel>(
                list: listaPropriedades,
                controler: controladores.controlerFazenda,
                icon: Icons.home,
              ),
              CustomTextLabel(texto: 'Tipo Pecuária'),
              CustomDropDownButtonForm<PecuariaModel>(
                list: listaTipoPecuaria,
                controler: controladores.controlerTipo,
                icon: Icons.pets,
              ),
              CustomTextLabel(texto: 'Finalidade'),
              CustomDropDownButtonForm(
                list: listaFinalidade,
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
                    if (entraSaida == 'ENTRADA') {
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
              CustomBotaoCadastrar(
                controladores: controladores,
                formKey: _formKey,
                listaPropriedades: listaPropriedades,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _reiniciaControladores() async {
    controladores.controlerDate =
        TextEditingController(text: Utils().DataHoje());
    controladores.controlerFazenda =
        ValueNotifier<PropriedadeModel>(PropriedadeModel(
      codigo: 0,
      nome: '',
    ));
    controladores.controlerTipo = ValueNotifier<PecuariaModel>(PecuariaModel(
      codigo: 0,
      descricao: '',
    ));
    controladores.controlerFinalidade = ValueNotifier<FinalidadeModel>(
        FinalidadeModel(codigo: 0, descricao: ''));
    controladores.controlerFazendaDestino =
        ValueNotifier<PropriedadeModel>(PropriedadeModel(
      codigo: 0,
      nome: '',
    ));
    controladores.controlerEntradaSaida = ValueNotifier('');
    controladores.controlerMotivo = ValueNotifier('');
    controladores.controlerIdade = TextEditingController();
    controladores.controlerSexo = ValueNotifier('');
    controladores.controlerQuantidade = TextEditingController();
    controladores.controlerValidadorIdade = ValueNotifier(true);
    controladores.controlerValidadorQuantidade = ValueNotifier(true);
    controladores.controlerValidadorData = ValueNotifier(true);
  }

  void _adcionaValores() {
    ListaEntradaSaida = <String>['ENTRADA', 'SAÍDA'];

    ListaMotivosEntrada = <String>['COMPRA', 'NASCIMENTO'];

    ListaMotivosSaida = <String>['VENDA', 'TRANSFERÊNCIA', 'MORTE', 'ABATE'];

    ListaMotivos = <String>['VENDA', 'TRANSFERÊNCIA', 'MORTE', 'ABATE'];

    ListaSexo = <String>['MACHO', 'FÊMEA'];
  }
}
