
import 'package:flutter/material.dart';
import 'package:forms/pages/classes/lotties.dart';
import 'package:forms/pages/lista_manejos.dart';
import 'package:forms/widgets/menu_appbar.dart';
import 'package:forms/widgets/text_label_report.dart';


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
          height: MediaQuery.of(context).size.height - 80,
           width: MediaQuery.of(context).size.width - 80,
          decoration: BoxDecoration(
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
                        fontSize: 36,
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
                    Color(0xFF64B5F6),
                    Color(0xFF90CAF9),
                    Color(0xFFBBDEFB),
                    Color(0xFFE3F2FB),
                    Color(0xFF90CAF9),
                ])
               ),
              child: Expanded(
                child: Column(
                  children: [
                        linha('Data: ', item.data),
                        linha('Propriedade: ', item.propriedade),
                        linha('Tipo Pecuária: ', item.pecuaria),
                        linha('Finalidade: ', item.finalidade),
                        linha('Tipo E/S: ', item.tipoES),
                        linha('Motivo: ', item.propriedade),
                        linha('Propriedade: ', item.propriedade),
                        linha('Idade: ', item.idade),
                        linha('Sexo: ', item.sexo),
                        linha('Quantidade: ', item.quantidade)
                  ],
                ),
              )
              ),
            ],),
          ),
      ),
        );
      }
    );
  }
}
