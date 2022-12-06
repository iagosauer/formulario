import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFieldPassword extends StatelessWidget {
  TextEditingController controler;
  CustomTextFieldPassword({
    Key? key,
    required this.controler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child:TextFormField(
      // autofocus: true,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Senha",
        labelStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
      style: const TextStyle(fontSize: 20),
      controller: controler,
    ),),
    ],
    );
  }
}
