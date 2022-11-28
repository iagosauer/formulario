import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/valores.dart';
import 'package:forms/models/manejo_model.dart';
import 'package:forms/pages/classes/navegacao.dart';
import 'package:forms/repositories/manejo_repository.dart';
import 'package:forms/widgets/menu_appbar.dart';

class ListaManejos extends StatefulWidget {
  const ListaManejos({super.key});

  static const String _title = 'Manejos';

  @override
  State<ListaManejos> createState() => _ListaManejosState();
}

class _ListaManejosState extends State<ListaManejos> {
  late ValueNotifier<ItensDeMenu> selectedMenu = ValueNotifier(ItensDeMenu.controlar);
  late List <CustomListItem> listaCustomItem;
  late bool carregando;
  var listaManejo = <ManejoModel>[];
  final ManejoRepository _manejoRepository = ManejoRepository();

  @override
  initState() {
    _buscarDados();
  }


  Future _buscarDados() async {
    try {
      setState(() {
        carregando = true;
      });
      listaManejo = await _manejoRepository.fetchTodosManejos();
      for(int i = 0; i<listaManejo.length; i++){
        listaManejo[i];

      }

      setState(() {
        //carregando = false;
      });
    } catch (e) {
      setState(() {
        //erro = true;
        //carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    selectedMenu.addListener( () => Navegacao(selectedMenu, context).acoesDeMenu());
    return MaterialApp(
      title: ListaManejos._title,
      home: Scaffold(
        appBar: AppBar(title: Text(ListaManejos._title), actions: <Widget>[
      MenuAppBar(selectedMenu: selectedMenu).build(context),
      ]),
        body: const MyStatelessWidget(),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _ManejoDescricao(
              title: "Manejo: $codigo",
              data: data,
              propriedade: propriedade,
              tipoES: tipoES,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}

class _ManejoDescricao extends StatelessWidget {
  const _ManejoDescricao({
    required this.title,
    required this.data,
    required this.propriedade,
    required this.tipoES
  });

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
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      children: <CustomListItem>[
        CustomListItem(
          data: '28/11/2022',
          propriedade: 'Fazenda Principio',
          thumbnail: Container(
           child: Image.asset(Valor.pathSuina)
          ),
          codigo: '1',
          tipoES: 'Saída',
        ),
        CustomListItem(
          data: '28/10/2022',
          propriedade: 'Fazenda Recanto',
          thumbnail: Container(
          child: Image.asset(Valor.pathBovino)
          ),
          codigo: '2',
          tipoES: 'Entrada',
        ),
      ],
    );
  }
}
