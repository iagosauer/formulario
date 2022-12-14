import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: library_prefixes
import 'package:flutter/widgets.dart' as Wid;
import 'package:forms/pages/classes/lotties.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:share_extend/share_extend.dart';


class GerarPDF{


  static createPDF(BuildContext context) async {
    var data = await rootBundle.load("assets/fonts/OpenSans-Regular.ttf");
    var myFont = Font.ttf(data);
    pw.TextStyle fonte = pw.TextStyle(font: myFont);
    final pdf = pw.Document();
    pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Text('Hello World!',
         style: fonte),
      ),
    ),
  );
  final String dir = (await getApplicationDocumentsDirectory()).path;
  String path = '$dir/example.pdf';
  final file = File(path);
  await file.writeAsBytes(await pdf.save());
  await file.open(mode: FileMode.read);

    // ignore: use_build_context_synchronously
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ViewPdf(
        path: path,
       ),
    ),
  );

  }
}


  class ViewPdf extends StatefulWidget {
  ViewPdf({required this.path});

  final String path;

  @override
  _ViewPdfState createState() => _ViewPdfState();
}


class _ViewPdfState extends State<ViewPdf> {
  late PDFDocument _doc;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(widget.path);
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Wid.Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Wid.Text('Flutter PDF'),
          actions: <Wid.Widget>[
            Wid.Padding(
              padding: const Wid.EdgeInsets.all(8.0),
              child: IconButton(
                  icon: const Wid.Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    ShareExtend.share(widget.path, "file",
                        sharePanelTitle: "Enviar PDF", subject: "example-pdf");
                  }),
            )
          ],
        ),
        body: _loading
            ? Wid.Center(
                child: Lotties.aminalLoading(),
              )
            : PDFViewer(document: _doc));
  }
}