import 'package:flutter/material.dart';

class JanelaDialog {
  final String mensagem;
  final String mensagemTrue;
    final String mensagemFalse;
  const JanelaDialog({required this.mensagem, this.mensagemFalse:'', required this.mensagemTrue});

  Future build(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text(mensagem),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(this.mensagemFalse,style: TextStyle(color: Colors.red),),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(this.mensagemTrue),
            ),
          ],
        ),
      );
  }
}
