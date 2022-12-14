
import 'package:flutter/material.dart';
import 'package:forms/pages/classes/gerar_pdf.dart';
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

  linha(String desc, String valor, double altura)
  {
    double fonte = altura * 0.0217;
    return Row(
      mainAxisAlignment : MainAxisAlignment.start,
      children: [
        CustomTextLabelReport(texto: desc, tamanhoFonte: fonte),
        CustomTextLabelReport(texto: valor, tamanhoFonte: fonte,),
        SizedBox(
          height: altura * 0.04,
        )
      ],
    );

  }

  abreManejo(CustomListItem item, BuildContext context) {
    String codigo = item.codigo;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    const shadow = BoxShadow(
                blurRadius: 10.0,
                color: Colors.black38,
                offset: Offset(0.0, 2.0),
                spreadRadius: 3,
              );
    showDialog(
      context: context,
      builder: (context) { 
        return Center(
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      color: Colors.transparent,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                     Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                          boxShadow: [shadow] ,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.blueAccent,
                      ),
                      child: Row(
                        children: [
                          Lotties.report(),
                          Text(
                            ' Manejo: $codigo',
                            style: const TextStyle(
                                fontFamily: 'Arial',
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container(),),                          
                          Container(
                            decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.red,
                          ),
                            child: Material(
                              color: Colors.transparent,
                              child: IconButton(onPressed: (){
                                GerarPDF.createPDF(context);
                              }, 
                              icon: const Icon(Icons.picture_as_pdf, 
                              color: Colors.white,),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [shadow] ,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
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
                    child: Column(
                      children: [
                            linha('Data:', item.data, height),
                            linha('Propriedade:', item.propriedade, height),
                            linha('Tipo Pecuária:', item.pecuaria, height),
                            linha('Finalidade:', item.finalidade, height),
                            linha('Tipo E/S:', item.tipoES, height),
                            linha('Motivo:', item.motivo, height),
                            linha('Idade:', item.idade, height),
                            linha('Sexo:', item.sexo, height),
                            linha('Quantidade:', item.quantidade, height),
                      ],
                    ),
                  ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                    height: (height * 0.072),
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
                                  fontSize: (20),
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
                  ],
                  ),
                ),
                    ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      color: Colors.transparent,
                      alignment: Alignment.topLeft,
                    ),
                  )
              ],
            ),
          ),
        );
      }
    );
  }
}
