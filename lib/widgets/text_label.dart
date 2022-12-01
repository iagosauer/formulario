import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/valores.dart';

class CustomTextLabel extends StatelessWidget {
  String texto;
  bool habilitado;

  CustomTextLabel({Key? key, required this.texto, this.habilitado=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Text(
            texto,
            // ignore: prefer_const_constructors
            style: TextStyle(
                fontFamily: 'Arial',
                color: habilitado ? Colors.blue : Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: Valor.distancia,
          ),
        ],
      ),
    );
  }
}
