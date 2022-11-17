import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:forms/models/usuario_model.dart';
import 'package:forms/repositories/usuario.repository.dart';
import 'package:forms/widgets/drop_down_button.dart';

import '../widgets/botao_login.dart';
import '../widgets/text_fiel_login.dart';
import '../widgets/text_field_password.dart';
import 'form_manejo.dart';

class TelaLogin extends StatefulWidget {
  final String title;
  TelaLogin({super.key, required this.title});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
   var list = <UsuarioModel>[];
    final respositoryUsuario = UsuarioRepository();
    ValueNotifier controler = ValueNotifier('');


  @override
  initState() {
    super.initState();
     _buscarDados();
  }

    Future _buscarDados() async {
      list = await respositoryUsuario.fetchUsuario();
      log(list.toString());
    }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/portal.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomDropDownButtonForm(list: list, controler: controler),
            const SizedBox(
              height: 10,
            ),
            CustomTextFieldPassword(),
            const SizedBox(
              height: 10,
            ),
            CustomBotaoLogin(),
          ],
        ),
      ),
    );
  }
}
