import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/valores.dart';
import 'package:forms/models/manejo_recebe_model.dart';
import 'package:forms/models/pecuaria_model.dart';
import 'package:forms/pages/classes/navegacao.dart';
import 'package:forms/repositories/manejo_repository.dart';
import 'package:forms/repositories/pecuaria_repository.dart';
import 'package:forms/widgets/menu_appbar.dart';

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

  String pathAnimal(String pecuaria) {
    String retorno;
    if (pecuaria.compareTo('AVICULTURA') == 0) {
      retorno = Valor.pathAvicultura;
    } else if (pecuaria.compareTo('SUÍNA') == 0) {
      retorno = Valor.pathSuina;
    } else if (pecuaria.compareTo('OVINA') == 0) {
      retorno = Valor.pathOvina;
    } else if (pecuaria.compareTo('EQUINA') == 0) {
      retorno = Valor.pathEquina;
    } else if (pecuaria.compareTo('BUFALINA') == 0) {
      retorno = Valor.pathBufalina;
    } else if (pecuaria.compareTo('AQUICULTURA') == 0) {
      retorno = Valor.pathAquicultura;
    } else {
      retorno = Valor.pathBovino;
    }

    return retorno;
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
        String pathImagem = pathAnimal(pecuaria.descricao);
        listaCustomItens.add(CustomListItem(
          data: listaManejo[i].data!,
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
      title: ListaManejos._title,
      home: Scaffold(
        appBar:
            AppBar(title: const Text(ListaManejos._title), actions: <Widget>[
          MenuAppBar(selectedMenu: selectedMenu).build(context),
        ]),
        body: carregando
            ? const Center(child: CircularProgressIndicator())
            : erro
                ? _buildErro()
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
  });

  final Widget thumbnail;
  final String codigo;
  final String data;
  final String propriedade;
  final String tipoES;

  @override
  Widget build(BuildContext context) {
    double comprimento = MediaQuery.of(context).size.width - 25;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: SizedBox(
                width: comprimento,
                height: 100,
                child: Row(
                  children: [
                    thumbnail,
                    _ManejoDescricao(
                      title: "Manejo: $codigo",
                      data: data,
                      propriedade: propriedade,
                      tipoES: tipoES,
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

class _ManejoDescricao extends StatelessWidget {
  const _ManejoDescricao(
      {required this.title,
      required this.data,
      required this.propriedade,
      required this.tipoES});

  final String title;
  final String data;
  final String propriedade;
  final String tipoES;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            'Data: $data',
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            propriedade,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            tipoES,
            style: const TextStyle(fontSize: 10.0),
          )
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
