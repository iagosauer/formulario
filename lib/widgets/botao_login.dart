import 'package:flutter/material.dart';
import 'package:forms/pages/form_manejo.dart';
import 'package:forms/widgets/janelaDialog.dart';

import '../repositories/usuario.repository.dart';



class CustomBotaoLogin extends StatefulWidget {

  final ValueNotifier login;
  final TextEditingController senha;
  CustomBotaoLogin(
      {super.key,
      required this.login,
      required this.senha,});

  @override
  State<CustomBotaoLogin> createState() => _CustomBotaoLoginState();
}

class _CustomBotaoLoginState extends State<CustomBotaoLogin> {
  bool validador = false;
 

  void _login(BuildContext context) async
  {
    var usuarioRepository = UsuarioRepository();
    if(await usuarioRepository.fetchLogin(login: widget.login.value.login,
     senha: widget.senha.text))
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FormManejo(),
        ),
      );
    }
    else
    { 
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario ou senha incorreto'),),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromARGB(255, 245, 133, 36),
                    Color.fromARGB(255, 110, 89, 228),
                  ],
                ),
                  borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: const SizedBox(
                          height: 28,
                          width: 28,
                          child: Icon(Icons.person),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                   _login(context);
                  },
                ),
              ),
    );
  }
}
