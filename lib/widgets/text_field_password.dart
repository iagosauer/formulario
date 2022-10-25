import 'package:flutter/material.dart';

class CustomTextFieldPassword extends StatelessWidget {
  CustomTextFieldPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
