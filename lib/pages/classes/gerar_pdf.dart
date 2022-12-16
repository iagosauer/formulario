import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: library_prefixes
import 'package:flutter/widgets.dart' as Wid;
import 'package:forms/pages/classes/lotties.dart';
import 'package:forms/pages/lista_manejos.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:share_extend/share_extend.dart';

class GerarPDF {
  static createPDF(BuildContext context, CustomListItem item) async {

    final pdf = pw.Document();
    pdf.addPage(await _pagina(item));
    final String dir = (await getApplicationDocumentsDirectory()).path;
    String path = '$dir/manejo${item.codigo}.pdf';
    final file = File(path);
    await file.writeAsBytes(await pdf.save());
    await file.open(mode: FileMode.read);

    ShareExtend.share(path, "file",
        sharePanelTitle: "Enviar PDF", subject: "example-pdf");

  }


  static Future<pw.Page> _pagina (CustomListItem item)
  async {
      var data = await rootBundle.load("assets/fonts/OpenSans-Regular.ttf");
      var myFont = Font.ttf(data);
      pw.TextStyle fonte = pw.TextStyle(
        font: myFont,
      );

      return pw.Page(
          build: (pw.Context context) => pw.Container(
            child: pw.Column(children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Manejo: ${item.codigo}',
                    style: pw.TextStyle(
                      font: myFont,
                      fontSize: 25,
                      color: PdfColor.fromHex('#000000'),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children:[
                pw.Expanded(
                  child: pw.Container(
                      height: 2.0, color: PdfColor.fromHex('#000000'),
                    ),
                ),
              ],
          ),
              _linha('Data: ${item.data}', myFont),
              _linha('Propriedade: ${item.propriedade}', myFont),
              _linha('Tipo Pecuária: ${item.pecuaria}', myFont),
              _linha('Finalidade: ${item.finalidade}', myFont),
              _linha('Tipo E\\S: ${item.tipoES}', myFont),
              _linha('Motivo: ${item.motivo}', myFont),
              _linha('Idade: ${item.idade}', myFont),
              _linha('Sexo: ${item.sexo}', myFont),
              _linha('Quantidade: ${item.quantidade}', myFont),

            ],
                ),
          ),
        );

  }

  static _linha(String string, Font myFont)
  {

    return pw.Column(
    children:[
    pw.SizedBox(height: 15),
     pw.Row(
            children: [ 
              pw.Text(
                          string,
                          style: pw.TextStyle(
                            font: myFont,
                            fontSize: 18,
                            color: PdfColor.fromHex('#000000'),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]
          ),]
    );

  }


}

