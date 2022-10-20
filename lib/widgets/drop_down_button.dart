// ignore_for_file: no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:forms/widgets/valores.dart';

class CustomDropDownButtonForm extends StatelessWidget {
  List<String> list;
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
    String dropdownValue = list.first;
    controler.value = dropdownValue;
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: DropdownButtonFormField<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            isExpanded: true,
            decoration: InputDecoration(
              labelText: labelUp == null ? '' : labelUp,
              border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Valor.radiusCircular))),
              prefixIcon: icon == null ? null : Icon(icon),
              enabled: habilitado,
            ),
            onChanged: (String? value) {
              dropdownValue = value!;
              controler.value = dropdownValue;
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: SizedBox(
                  child: Text(value, textAlign: TextAlign.center),
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
