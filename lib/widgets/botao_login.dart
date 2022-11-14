import 'package:flutter/material.dart';
import 'package:forms/pages/form_manejo.dart';



class CustomBotaoLogin extends StatefulWidget {


  CustomBotaoLogin(
      {super.key});

  @override
  State<CustomBotaoLogin> createState() => _CustomBotaoLoginState();
}

class _CustomBotaoLoginState extends State<CustomBotaoLogin> {
  bool validador = false;
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormManejo(),
                      ),
                    );
                  },
                ),
              ),
    );
  }
}
