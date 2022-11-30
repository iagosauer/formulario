import 'package:flutter/material.dart';
import 'package:forms/pages/filtro_manejo.dart';
import 'package:forms/pages/form_manejo.dart';
import 'package:forms/pages/lista_manejos.dart';

import '../../widgets/menu_appbar.dart';

class Navegacao{

  final ValueNotifier<ItensDeMenu> selectedMenu;
  final BuildContext context;
  Navegacao(this.selectedMenu, this.context);

  acoesDeMenu()
  {
    if(selectedMenu.value == ItensDeMenu.cadastrar)
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  FormManejo(),
        ),
      );
    }
    else if (selectedMenu.value == ItensDeMenu.visualizar)
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  FiltroManejos(),
        ),
      );
    }
  }

}