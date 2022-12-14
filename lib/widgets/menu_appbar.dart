import 'package:flutter/material.dart';
import 'package:forms/pages/classes/navegacao.dart';

enum ItensDeMenu {controlar, cadastrar, visualizar}
// ignore: must_be_immutable
class MenuAppBar extends StatelessWidget {
  ValueNotifier<ItensDeMenu> selectedMenu;
  MenuAppBar({super.key,
  required this.selectedMenu });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ItensDeMenu>(
              onSelected: (ItensDeMenu item) {
              selectedMenu.value = item;
              Navegacao(selectedMenu, context).acoesDeMenu();
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<ItensDeMenu>>[
                    const PopupMenuItem<ItensDeMenu>(
                      value: ItensDeMenu.cadastrar,
                      child: Text('Cadastrar Manejo'),
                    ),
                    const PopupMenuItem<ItensDeMenu>(
                      value: ItensDeMenu.visualizar,
                      child: Text('Visualizar Manejos'),
                    ),
                  ]);
  }
}