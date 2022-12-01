import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/Utils.dart';
import 'package:forms/Auxiliares/valores.dart';
import 'package:forms/models/manejo_recebe_model.dart';
import 'package:forms/models/pecuaria_model.dart';
import 'package:forms/pages/classes/manejo_card.dart';
import 'package:forms/pages/classes/navegacao.dart';
import 'package:forms/repositories/manejo_repository.dart';
import 'package:forms/repositories/pecuaria_repository.dart';
import 'package:forms/widgets/menu_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

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
      PecuariaRepository pecuariaRepository = PecuariaRepository();
      listaManejo = await _manejoRepository.fetchTodosManejos();
      for (int i = 0; i < listaManejo.length; i++) {
        PecuariaModel pecuaria = await pecuariaRepository
            .fetchUmaPecuaria(listaManejo[i].codTipoPecuaria.toString());
        String pathImagem = Valor.ideia[pecuaria.descricao]!;
        listaCustomItens.add(CustomListItem(
          pecuaria: pecuaria.descricao,
          data: Utils().ConverteDateParaDataString(listaManejo[i].data!),
          propriedade: listaManejo[i].codPropriedade!,
          thumbnail: Image.asset(pathImagem),
          codigo: listaManejo[i].codigo.toString(),
          tipoES: listaManejo[i].tipoOperacao!,
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
      title: ListaManejos._title,
      home: Scaffold(
        appBar:
            AppBar(title: const Text(ListaManejos._title), actions: <Widget>[
          MenuAppBar(selectedMenu: selectedMenu).build(context),
        ]),
        body: carregando
            ? const Center(child: CircularProgressIndicator())
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
  });

  final Widget thumbnail;
  final String codigo;
  final String data;
  final String propriedade;
  final String tipoES;
  final String pecuaria;

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
                debugPrint('Manejo: $codigo');
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
                      thumbnail:thumbnail
                    ),
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
