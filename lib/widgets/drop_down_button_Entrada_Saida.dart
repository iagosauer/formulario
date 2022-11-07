// ignore_for_file: no_logic_in_create_state
import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/valores.dart';

class CustomDropDownButtonFormEntradaSaida extends StatefulWidget {
  List<String> list;
  String? labelUp;
  IconData? icon;
  bool habilitado;
  ValueNotifier controler;
  List<String> ListaMotivosEntrada;
  List<String> ListaMotivosSaida;
  List<String> ListaMotivos;
  CustomDropDownButtonFormEntradaSaida(
      {super.key,
      required this.list,
      this.labelUp,
      this.icon,
      this.habilitado: true,
      required this.controler,
      required this.ListaMotivosEntrada,
      required this.ListaMotivosSaida,
      required this.ListaMotivos});

  @override
  State<CustomDropDownButtonFormEntradaSaida> createState() =>
      _CustomDropDownButtonFormEntradaSaidaState();
}

class _CustomDropDownButtonFormEntradaSaidaState
    extends State<CustomDropDownButtonFormEntradaSaida> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.list.first;
    widget.controler.value = dropdownValue;
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: DropdownButtonFormField<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            isExpanded: true,
            decoration: InputDecoration(
              labelText: widget.labelUp == null ? '' : widget.labelUp,
              border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Valor.radiusCircular))),
              prefixIcon: widget.icon == null ? null : Icon(widget.icon),
              enabled: widget.habilitado,
            ),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
                widget.controler.value = dropdownValue;
                if (dropdownValue == 'Entrada') {
                  widget.ListaMotivos = widget.ListaMotivosEntrada;
                } else {
                  widget.ListaMotivos = widget.ListaMotivosSaida;
                }
              });
            },
            items: widget.list.map<DropdownMenuItem<String>>((String value) {
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
