import 'package:flutter/material.dart';

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
