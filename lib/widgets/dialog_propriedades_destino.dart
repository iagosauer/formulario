import 'package:flutter/material.dart';
import 'package:forms/models/propriedade_model.dart';
import 'package:forms/widgets/drop_down_button_dialog.dart';


class JanelaDialogPropiedadeDestino {
  final String mensagem;
  final String mensagemTrue;
  final String mensagemFalse;
  final List<PropriedadeModel> listaPropriedades;
  final ValueNotifier<PropriedadeModel> controlador;
  JanelaDialogPropiedadeDestino(
      {required this.mensagem,
      this.mensagemFalse: '',
      required this.mensagemTrue,
      required this.listaPropriedades, 
      required this.controlador});

  Future build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          width: size.width,
          height: 150,
          child: Column(
            children: [
              Text(mensagem),
            SizedBox(
              child: CustomDropDownButtonDialogForm(
                controler: controlador,
                list: listaPropriedades,
                habilitado: true,
                icon: Icons.home,
              ),
            ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              mensagemFalse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(mensagemTrue),
          ),
        ],
      ),
    );
  }
}
