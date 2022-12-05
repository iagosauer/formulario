import 'dart:js';

import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/Utils.dart';
import 'package:forms/Auxiliares/valores.dart';
import 'package:forms/models/finalidade_model.dart';
import 'package:forms/models/manejo_recebe_model.dart';
import 'package:forms/models/pecuaria_model.dart';
import 'package:forms/pages/classes/lotties.dart';
import 'package:forms/pages/classes/manejo_card.dart';
import 'package:forms/pages/classes/navegacao.dart';
import 'package:forms/pages/relatorio_manejo.dart';
import 'package:forms/repositories/finalidade_repository.dart';
import 'package:forms/repositories/manejo_repository.dart';
import 'package:forms/repositories/pecuaria_repository.dart';
import 'package:forms/widgets/menu_appbar.dart';
import 'package:forms/widgets/text_label_report.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popup_card/popup_card.dart';

class ListaManejos extends StatefulWidget {
  const ListaManejos({super.key});

  static const String _title = 'Manejos';

  @override
  State<ListaManejos> createState() => _ListaManejosState();
}

class _ListaManejosState extends State<ListaManejos> {
  late ValueNotifier<ItensDeMenu> selectedMenu =
      ValueNotifier(ItensDeMenu.controlar);
  late List<CustomListItem> listaCustomItens = <CustomListItem>[];
  bool carregando = false;
  bool erro = false;
  var listaManejo = <ManejoRecebeModel>[];
  final _manejoRepository = ManejoRepository();

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
      listaManejo = await _manejoRepository.fetchTodosManejos();
      for (int i = 0; i < listaManejo.length; i++) {
        String pathImagem = Valor.imagensPecuaria[listaManejo[i].pecuariaModel!.descricao]!;
        listaCustomItens.add(CustomListItem(
          idade: listaManejo[i].idade.toString(),
          sexo: listaManejo[i].sexo!,
          quantidade: listaManejo[i].quantidade.toString(),
          motivo: listaManejo[i].motivos!,
          pecuaria: listaManejo[i].pecuariaModel!.descricao,
          data: Utils().ConverteDateParaDataString(listaManejo[i].data!),
          propriedade: listaManejo[i].propriedadeModel!.nome,
          thumbnail: Image.asset(pathImagem),
          codigo: listaManejo[i].codigo.toString(),
          tipoES: listaManejo[i].tipoOperacao!,
          finalidade: listaManejo[i].finalidadeModel!.descricao,
        ));
      }

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
      title: ListaManejos._title,
      home: Scaffold(
        appBar:
            AppBar(title: const Text(ListaManejos._title), actions: <Widget>[
          MenuAppBar(selectedMenu: selectedMenu).build(context),
        ]),
        body: carregando
            ? Center(child: Lotties.aminalLoading())
            : erro
                ? Valor.buildErro(context)
                : MyStatelessWidget(listaCustomItens: listaCustomItens),
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.thumbnail,
    required this.codigo,
    required this.data,
    required this.propriedade,
    required this.tipoES,
    required this.pecuaria,
    required this.finalidade,
    required this.motivo,
    required this.idade,
    required this.sexo,
    required this.quantidade
  });

  final Widget thumbnail;
  final String codigo;
  final String data;
  final String propriedade;
  final String tipoES;
  final String pecuaria;
  final String finalidade;
  final String motivo;
  final String idade;
  final String sexo;
  final String quantidade;

  abreManejo(CustomListItem item, BuildContext context) {
    RelatorioManejo(item: item, context: context,).build(context);
  }

  @override
  Widget build(BuildContext context) {
    double comprimento = MediaQuery.of(context).size.width - 25;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 10,
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                abreManejo(this, context);
              },
              child: SizedBox(
                width: comprimento,
                height: 210,
                child: Row(
                  children: [
                    ManejoCard(
                        pecuaria: pecuaria,
                        title: codigo,
                        data: data,
                        propriedade: propriedade,
                        tipoES: tipoES,
                        thumbnail: thumbnail),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: Valor.distancia,
          ),
        ],
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  final List<CustomListItem> listaCustomItens;
  const MyStatelessWidget({super.key, required this.listaCustomItens});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      children: listaCustomItens,
    );
  }
}
