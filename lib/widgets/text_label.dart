import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/Valores.dart';

// ignore: must_be_immutable
class CustomTextLabel extends StatelessWidget {
  String texto;
  bool habilitado;
  double espacamento;

  CustomTextLabel({Key? key, required this.texto, this.habilitado=true,
  this.espacamento = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: espacamento),
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
