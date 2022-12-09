import 'package:flutter/material.dart';
import 'package:forms/pages/classes/controladores_cadastro_manejo.dart';
import 'package:forms/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(    
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Controladores()),
    ],
    child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'formulário',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Manejo'),
    );
  }
}
