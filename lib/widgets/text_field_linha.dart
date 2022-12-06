import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:forms/Auxiliares/Utils.dart';
import 'package:forms/Auxiliares/valores.dart';

// ignore: must_be_immutable
class CustomTextFieldLinha extends StatelessWidget {
  TextEditingController controler;
  String? labelHint;
  bool habilitado;
  IconData? icon;
  bool data;
  bool inteiro;
  String? textoInicial = '';

  CustomTextFieldLinha(
      {Key? key,
      required this.controler,
      this.labelHint,
      this.habilitado: true,
      this.icon,
      this.data = false,
      this.inteiro = false,
      this.textoInicial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> inputFormatter;
    String mensagemErro = '';
    if (data) {
      inputFormatter = [
        FilteringTextInputFormatter.digitsOnly,
        
        DataInputFormatter()
      ];
    } else if (inteiro) {
      inputFormatter = [
        FilteringTextInputFormatter.digitsOnly,
      ];
    } else {
      inputFormatter = [];
    }
    
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: TextFormField(
            inputFormatters: inputFormatter,
            decoration: InputDecoration(
              labelText: labelHint,
              errorText: mensagemErro == '' ? null : mensagemErro,
              prefixIcon: icon == null ? null : Icon(icon),
              enabled: habilitado,
            ),
            controller: controler,
            validator: (value) {
              if (data) {
                if (Utils().dataValida(controler.text)) {
                  return null;
                } else {
                  return 'Data Inválida';
                }
              }
              if (controler.text.compareTo('') == 0) {
                return 'Valor Inválido!';
              } else {
                return null;
              }
            },
          ),
        ),
        const SizedBox(
          height: Valor.distancia + 30,
        ),
      ],
    );
  }
}
