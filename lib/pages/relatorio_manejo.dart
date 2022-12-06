
import 'package:flutter/material.dart';
import 'package:forms/pages/classes/lotties.dart';
import 'package:forms/pages/lista_manejos.dart';
import 'package:forms/widgets/menu_appbar.dart';
import 'package:forms/widgets/text_label_report.dart';


// ignore: must_be_immutable
class RelatorioManejo extends StatelessWidget {
  RelatorioManejo({super.key, required this.item, required this.context});
  BuildContext context;
  CustomListItem item;
  late ValueNotifier<ItensDeMenu> selectedMenu =
      ValueNotifier(ItensDeMenu.controlar);

  @override
  Widget build(BuildContext context) {
    return abreManejo(item, context);
      
  }

  linha(String desc, String valor)
  {
    return Row(
      mainAxisAlignment : MainAxisAlignment.start,
      children: [
        CustomTextLabelReport(texto: desc),
        CustomTextLabelReport(texto: valor,),
      ],
    );

  }

  abreManejo(CustomListItem item, BuildContext context) {
    String codigo = item.codigo;
    showDialog(
      context: context,
      builder: (context) { 
        return Center(
          child: Container(
          margin: const EdgeInsets.symmetric(vertical: 120.0),
          //height: MediaQuery.of(context).size.height - 250,
           width: MediaQuery.of(context).size.width - 80,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Card(
              color: Colors.blueAccent,
              child: Row(
                children: [
                  Lotties.report(),
                  Text(
                    'Manejo: $codigo',
                    style: const TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF1565C0),
                    Color(0xFF1976D2),
                    Color(0xFF1E88E5),
                    Color(0xFF2196F3),
                    Color(0xFF42A5F5),
                ],),
               ),
              child: Expanded(
                child: Column(
                  children: [
                        linha('Data:', item.data),
                        linha('Propriedade:', item.propriedade),
                        linha('Tipo Pecuária:', item.pecuaria),
                        linha('Finalidade:', item.finalidade),
                        linha('Tipo E/S:', item.tipoES),
                        linha('Motivo:', item.propriedade),
                        linha('Idade:', item.idade),
                        linha('Sexo:', item.sexo),
                        linha('Quantidade:', item.quantidade),
                  ],
                ),
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromARGB(255, 223, 26, 58),
                    Color.fromARGB(255, 228, 89, 165),
                  ],
                ),
                  borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Center(
                        child: Text(
                          textDirection: TextDirection.ltr,
                          "SAIR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: Icon(Icons.exit_to_app_rounded),
                      )
                    ],
                  ),
                  onPressed: () {
                   Navigator.pop(context);
                  },
                ),
              ),
    )
            ],),
          ),
      ),
        );
      }
    );
  }
}
