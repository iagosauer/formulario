import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/valores.dart';

// ignore: must_be_immutable
class CustomTextLabelReport extends StatelessWidget {
  String texto;
  bool habilitado;

  CustomTextLabelReport({Key? key, required this.texto, this.habilitado=true}) : super(key: key);

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
                color:  Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: Valor.distancia * 2,
          ),
        ],
      ),
    );
  }
}
