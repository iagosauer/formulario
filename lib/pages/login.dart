import 'package:flutter/material.dart';

import '../widgets/text_fiel_login.dart';
import '../widgets/text_field_password.dart';

class TelaLogin extends StatelessWidget {
  final String title;
  const TelaLogin({super.key, required this.title});

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
            CustomTextFieldLog(),
            const SizedBox(
              height: 10,
            ),
            CustomTextFieldPassword(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
