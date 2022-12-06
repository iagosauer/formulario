import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/Valores.dart';
import 'package:forms/pages/classes/controladores_filtro.dart';
import 'package:forms/pages/classes/navegacao.dart';
import 'package:forms/widgets/botao_filtrar.dart';
import 'package:forms/widgets/menu_appbar.dart';
import 'package:forms/widgets/text_field_linha.dart';
import 'package:forms/widgets/text_label.dart';

// ignore: must_be_immutable
class FiltroManejos extends StatefulWidget {
  FiltroManejos({super.key});
  var controladores = ControladoresFiltro();
  static const String _title = 'Manejos';

  @override
  // ignore: no_logic_in_create_state
  State<FiltroManejos> createState() => _ListaManejosState(controladores: controladores);
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


  @override
  Widget build(BuildContext context) {
    selectedMenu
        .addListener(() => Navegacao(selectedMenu, context).acoesDeMenu());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: FiltroManejos._title,
      home: Scaffold(
        appBar:
            AppBar(title: const Text(FiltroManejos._title), actions: <Widget>[
          MenuAppBar(selectedMenu: selectedMenu).build(context),
        ]),
        body: carregando
            ? const Center(child: CircularProgressIndicator())
            : erro
                ? Valor.buildErro(context)
                : MyStatelessWidget(controladores: controladores, ),
      ),
    );
  }
}




class MyStatelessWidget extends StatefulWidget {
  final ControladoresFiltro controladores;
  MyStatelessWidget({super.key, required this.controladores});

  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  ValueNotifier<bool> pesquisaTodos = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Padding(padding: const EdgeInsets.all(20),
        child: Column(children: [
          CustomTextLabel(texto: 'Data Inicial:',
          habilitado: widget.controladores.controlerHabilitadoCodigo.value,),
          CustomTextFieldLinha(controler: widget.controladores.controlerDataInicial,
          inteiro: true,
          habilitado: widget.controladores.controlerHabilitadoCodigo.value,
          data: true,
          ),
            CustomTextLabel(texto: 'Data Final:',
            habilitado: widget.controladores.controlerHabilitadoCodigo.value,),
            CustomTextFieldLinha(controler: widget.controladores.controlerDataFinal,
          inteiro: true,
          habilitado: widget.controladores.controlerHabilitadoCodigo.value,
          data: true,
          ),
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               CustomTextLabel(texto: 'Pesquisar todos os manejos:',
            habilitado: true,),
              Checkbox(
                checkColor: Colors.white,
                value: pesquisaTodos.value,
                onChanged: (bool? value) {
                  setState(() {
                    pesquisaTodos.value = value!;
                    widget.controladores.controlerHabilitadoCodigo.value = !value;
                  });
      },
    ),
            ],
          ),
          CustomBotaoFiltrar(data1: widget.controladores.controlerDataInicial,
           data2: widget.controladores.controlerDataFinal,),
        ]),
      ),
      
    );
  }
}
