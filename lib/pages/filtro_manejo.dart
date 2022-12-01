import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/valores.dart';
import 'package:forms/pages/classes/controladores_filtro.dart';
import 'package:forms/pages/classes/lotties.dart';
import 'package:forms/pages/classes/manejo_card.dart';
import 'package:forms/pages/classes/navegacao.dart';
import 'package:forms/widgets/botao_filtrar.dart';
import 'package:forms/widgets/menu_appbar.dart';
import 'package:forms/widgets/swicth_linha.dart';
import 'package:forms/widgets/text_field.dart';
import 'package:forms/widgets/text_field_linha.dart';
import 'package:forms/widgets/text_label.dart';

class FiltroManejos extends StatefulWidget {
  FiltroManejos({super.key});
  var controladores = ControladoresFiltro();
  static const String _title = 'Manejos';

  @override
  State<FiltroManejos> createState() =>
      _ListaManejosState(controladores: controladores);
}

class _ListaManejosState extends State<FiltroManejos> {
  late ValueNotifier<ItensDeMenu> selectedMenu =
      ValueNotifier(ItensDeMenu.controlar);
  final ControladoresFiltro controladores;
  bool carregando = false;
  bool erro = false;

  _ListaManejosState({required this.controladores});

  @override
  initState() {
    super.initState();
    _buscarDados();
  }

  Future _buscarDados() async {
    try {
      setState(() {
        carregando = true;
      });
      setState(() {
        carregando = false;
      });
    } catch (e) {
      setState(() {
        erro = true;
        carregando = false;
      });
    }
  }

  _buildErro() {
    return const Center(
      child: Text(
        'Erro ao carregar dados!',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    selectedMenu
        .addListener(() => Navegacao(selectedMenu, context).acoesDeMenu());
    return MaterialApp(
      title: FiltroManejos._title,
      home: Scaffold(
        appBar:
            AppBar(title: const Text(FiltroManejos._title), actions: <Widget>[
          MenuAppBar(selectedMenu: selectedMenu).build(context),
        ]),
        body: carregando
            ? Center(child: Lotties.aminalLoading())
            : erro
                ? Valor.buildErro(context)
                : MyStatelessWidget(
                    controladores: controladores,
                  ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  final ControladoresFiltro controladores;
  const MyStatelessWidget({super.key, required this.controladores});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          CustomTextLabel(
            texto: 'Data Inicial:',
            habilitado: controladores.controlerHabilitadoCodigo.value,
          ),
          CustomTextFieldLinha(
            controler: controladores.controlerDataInicial,
            inteiro: true,
            habilitado: controladores.controlerHabilitadoCodigo.value,
            data: true,
          ),
          CustomTextLabel(
            texto: 'Data Final:',
            habilitado: controladores.controlerHabilitadoCodigo.value,
          ),
          CustomTextFieldLinha(
            controler: controladores.controlerDataFinal,
            inteiro: true,
            habilitado: controladores.controlerHabilitadoCodigo.value,
            data: true,
          ),
          CustomBotaoFiltrar(),
        ]),
      ),
    );
  }
}
