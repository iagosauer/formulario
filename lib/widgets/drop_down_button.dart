// ignore_for_file: no_logic_in_create_state
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forms/models/finalidade_model.dart';
import 'package:forms/Auxiliares/Valores.dart';
import 'package:forms/models/usuario_model.dart';
import '../models/pecuaria_model.dart';
import '../models/propriedade_model.dart';

// ignore: must_be_immutable
class CustomDropDownButtonForm<T> extends StatelessWidget {
  List<T> list;
  String? labelUp;
  IconData? icon;
  bool habilitado;
  ValueNotifier controler;
  CustomDropDownButtonForm(
      {super.key,
      required this.list,
      this.labelUp,
      this.icon,
      this.habilitado: true,
      required this.controler});

  @override
  Widget build(BuildContext context) {
    T dropdownValue = list.first;
    controler.value = dropdownValue;
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: DropdownButtonFormField<T>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            isExpanded: true,
            decoration: InputDecoration(
              labelText: labelUp ?? '',
              border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Valor.radiusCircular))),
              prefixIcon: icon == null ? null : Icon(icon),
              enabled: habilitado,
            ),
            onChanged: (T? value) {
              dropdownValue = value!;
              controler.value = dropdownValue;
              log(controler.value);
            },
            items: list.map<DropdownMenuItem<T>>((T value) {
              var texto = '';
              if (value is String) {
                texto = value;
              } else if (value is PecuariaModel) {
                texto = value.descricao;
              } else if (value is PropriedadeModel) {
                texto = value.nome;
              } else if (value is FinalidadeModel) {
                texto = value.descricao;
              } else if(value is UsuarioModel){
                texto = value.login;
              }

              return DropdownMenuItem<T>(
                value: value,
                child: SizedBox(
                  child: Text(texto, textAlign: TextAlign.center),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: Valor.distancia,
        ),
      ],
    );
  }
}
