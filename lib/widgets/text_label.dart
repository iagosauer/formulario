import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/valores.dart';

class CustomTextLabel extends StatelessWidget {
  String texto;

  CustomTextLabel({Key? key, required this.texto}) : super(key: key);

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
                color: Colors.blue,
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
