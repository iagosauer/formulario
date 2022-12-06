import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/Utils.dart';
import 'package:forms/Auxiliares/Valores.dart';
import 'package:forms/models/manejo_recebe_model.dart';
import 'package:forms/pages/classes/lotties.dart';
import 'package:forms/pages/classes/manejo_card.dart';
import 'package:forms/pages/classes/navegacao.dart';
import 'package:forms/pages/relatorio_manejo.dart';
import 'package:forms/repositories/manejo_repository.dart';
import 'package:forms/widgets/menu_appbar.dart';

// ignore: must_be_immutable
class ListaManejos extends StatefulWidget {
   ListaManejos({super.key, this.data1, this.data2});

  static const String _title = 'Manejos';
  String? data1;
  String? data2;

  @override
  State<ListaManejos> createState() => _ListaManejosState();
}

class _ListaManejosState extends State<ListaManejos> {
  late ValueNotifier<ItensDeMenu> selectedMenu =
      ValueNotifier(ItensDeMenu.controlar);
  late List<CustomListItem> listaCustomItens = <CustomListItem>[];
  bool carregando = true;
  bool erro = false;
  var listaManejo = <ManejoRecebeModel>[];
  final _manejoRepository = ManejoRepository();


  Future<void> _confereDatasEBusca()
  async {
    if((widget.data1 != null) && (widget.data2 !=null))
    {
      listaManejo = await _manejoRepository.fetchManejoEntreDatas(widget.data1!, widget.data2!);
    }
    else if (widget.data1 != null) 
    {
      listaManejo = await _manejoRepository.fetchManejoEntreDatas(widget.data1!, widget.data1!);
    }else if(widget.data2 != null) {
      listaManejo = await _manejoRepository.fetchManejoEntreDatas(widget.data2!, widget.data2!);
    }
    else {
      listaManejo = await _manejoRepository.fetchTodosManejos();
    }
    _buscarDados();
  }

  @override
  initState(){
    super.initState();
    _confereDatasEBusca();
  }

  Future _buscarDados() async {
    try {
      setState(() {
        carregando = true;
      });
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
