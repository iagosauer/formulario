import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../pages/classes/lotties.dart';

class Valor {
  static const double distancia = 25;
  static const double radiusCircular = 40;
  static String baseUrl = dotenv.get('HOST');
  static const String pathAquicultura = "assets/images/aquicultura.png";
  static const String pathAvicultura = "assets/images/avicultura.png";
  static const String pathBufalina = "assets/images/bufalina.png";
  static const String pathBovino = "assets/images/bovino.png";
  static const String pathEquina = "assets/images/equina.png";
  static const String pathOvina = "assets/images/ovina.png";
  static const String pathSuina = "assets/images/suina.png";

  static const imagensPecuaria = {
    'AVICULTURA': pathAvicultura,
    'SUÍNA': pathSuina,
    'OVINA': pathOvina,
    'EQUINA': pathEquina,
    'BUFALINA': pathBufalina,
    'AQUICULTURA': pathAquicultura,
    'BOVINA': pathBovino
  };

  static buildErro(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height / 2) - 100,
        ),
        Center(
          child: Lotties.erroInternet(),
        ),
        const Text(
          'Erro ao carregar dados!',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
