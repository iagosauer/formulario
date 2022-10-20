import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:forms/widgets/valores.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controler;
  String labelHint;
  bool habilitado;
  IconData? icon;
  bool data;
  bool inteiro;
  String? textoInicial = '';

  CustomTextField(
      {Key? key,
      required this.controler,
      required this.labelHint,
      this.habilitado: true,
      this.icon,
      this.data: false,
      this.inteiro: false,
      this.textoInicial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: TextFormField(
            inputFormatters: inteiro == false
                ? null
                : [
                    FilteringTextInputFormatter.digitsOnly,
                    if (data) DataInputFormatter()
                  ],
            decoration: InputDecoration(
              labelText: labelHint,
              label: textoInicial == null ? null : Text(textoInicial!),
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

/*An InputDecorator, which is typically created by a TextField, cannot have an unbounded width.\nThis
happens when the parent widget does not provide a finite width constraint. For example, if the
InputDecorator is contained by a Row, then its width must be constrained. An Expanded widget or a
SizedBox can be used to constrain the width of the InputDecorator or the TextField that contains
it."*/