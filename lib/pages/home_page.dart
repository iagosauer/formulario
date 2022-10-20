import 'package:flutter/material.dart';
import 'package:forms/widgets/text_field.dart';

import 'form_manejo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FormManejo(title: widget.title);
  }
}
