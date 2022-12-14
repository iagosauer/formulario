import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/Valores.dart';
import 'package:forms/models/usuario_model.dart';
import 'package:forms/pages/classes/lotties.dart';
import 'package:forms/repositories/usuario.repository.dart';
import 'package:forms/widgets/drop_down_button.dart';
import '../widgets/botao_login.dart';
import '../widgets/text_field_password.dart';

class TelaLogin extends StatefulWidget {
  final String title;
  // ignore: prefer_const_constructors_in_immutables
  TelaLogin({super.key, required this.title});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var list = <UsuarioModel>[];
  final respositoryUsuario = UsuarioRepository();
  ValueNotifier controlerLogin = ValueNotifier('');
  TextEditingController controlerSenha = TextEditingController();
  bool carregando = false;
  bool erro = false;

  @override
  initState() {
    super.initState();
    _buscarDados();
  }

  Future _buscarDados() async {
    try {
      setState(() {
        carregando = true;
      });
      list = await respositoryUsuario.fetchUsuario();
      setState(() {
        carregando = false;
      });
    } catch (e) {
      setState(() {
        erro = true;
        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: carregando
            ? Center(
                child: Lotties.aminalLoading()
              )
            : erro
                ? Valor.buildErro(context)
                : _Sucesso());
  }

  // ignore: non_constant_identifier_names
  SingleChildScrollView _Sucesso() {
    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TweenAnimationBuilder<double>(
                  duration: const Duration(seconds: 2),
                  curve: Curves.bounceOut,
                  tween: Tween(begin: 30, end: 5),
                  builder: (context, value, _) {
                    return SizedBox(
                      width: 128,
                      height: 128,
                      child: Transform.scale(
                        scale: value * .2,
                        child: Image.asset(
                          "assets/portal.png",
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomDropDownButtonForm(list: list, controler: controlerLogin),
              const SizedBox(
                height: 10,
              ),
              CustomTextFieldPassword(controler: controlerSenha),
              const SizedBox(
                height: 10,
              ),
              CustomBotaoLogin(
                login: controlerLogin,
                senha: controlerSenha,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
