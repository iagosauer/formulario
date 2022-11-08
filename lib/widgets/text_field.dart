import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:forms/Auxiliares/valores.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controler;
  String? labelHint;
  bool habilitado;
  IconData? icon;
  bool data;
  bool inteiro;
  String? textoInicial = '';

  CustomTextField(
      {Key? key,
      required this.controler,
      this.labelHint,
      this.habilitado: true,
      this.icon,
      this.data: false,
      this.inteiro: false,
      this.textoInicial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> inputFormatter;
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
          width: MediaQuery.of(context).size.width - 40,
          child: TextFormField(
            inputFormatters: inputFormatter,
            decoration: InputDecoration(
              labelText: labelHint ?? null,
              //label: textoInicial == null ? null : Text(textoInicial!),
              border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Valor.radiusCircular))),
              prefixIcon: icon == null ? null : Icon(icon),
              enabled: habilitado,
            ),
            controller: controler,
          ),
        ),
        const SizedBox(
          height: Valor.distancia,
        ),
      ],
    );
  }
}
