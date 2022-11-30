import 'dart:html';

import 'package:flutter/material.dart';

class SwitchApp extends StatelessWidget {
  SwitchApp({super.key, required this.controlador});
  final ValueNotifier<bool>  controlador;

  @override
  Widget build(BuildContext context) {
    double comprimento = MediaQuery.of(context).size.width - 100;
    return Row(
          children: [
            SwitchExample(controlador: controlador,),
          ],
        );
  }
}


class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key, required this.controlador});
  final ValueNotifier<bool> controlador;

  @override
  // ignore: no_logic_in_create_state
  State<SwitchExample> createState() => _SwitchExampleState(controlador: controlador);
}

class _SwitchExampleState extends State<SwitchExample> {
  final ValueNotifier<bool> controlador;

  _SwitchExampleState({required this.controlador});

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: controlador.value,
      activeColor: Colors.red,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          controlador.value = value;
        });
      },
    );
  }
}
