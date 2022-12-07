import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/Valores.dart';

// ignore: must_be_immutable
class CustomTextLabelReport extends StatelessWidget {
  String texto;
  bool habilitado;
  double tamanhoFonte;

  CustomTextLabelReport({Key? key, required this.texto, this.habilitado=true, this.tamanhoFonte=18}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            texto,
            // ignore: prefer_const_constructors
            style: TextStyle(
                fontFamily: 'Arial',
                color:  Colors.white,
                fontSize: tamanhoFonte,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
