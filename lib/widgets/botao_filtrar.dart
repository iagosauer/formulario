import 'package:flutter/material.dart';
import 'package:forms/Auxiliares/Utils.dart';
import 'package:forms/pages/lista_manejos.dart';
import 'package:forms/Auxiliares/Valores.dart';
import '../models/propriedade_model.dart';

class CustomBotaoFiltrar extends StatefulWidget {

  CustomBotaoFiltrar(
      {super.key, this.data1, this.data2});
       TextEditingController? data1;
        TextEditingController?  data2;



  @override
  State<CustomBotaoFiltrar> createState() => _CustomBotaoCadastrarState();
}

class _CustomBotaoCadastrarState extends State<CustomBotaoFiltrar> {
  bool validador = false;
  final ValueNotifier<PropriedadeModel> controladorDestino = ValueNotifier<PropriedadeModel>(PropriedadeModel(
    codigo: 0,
    nome: '',
  ),);




  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(2 * Valor.radiusCircular),
        ),
      ),
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () async {
          String? data1 = widget.data1?.text;
          String? data2 = widget.data2?.text;
          if(data1 != null)
          {
            if(!Utils.dataValida(data1))
            {
              data1 = null;
            }
          }
          if(data2 != null)
          {
            if(!Utils.dataValida(data2))
            {
              data2 = null;
            }
          }

        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  ListaManejos(data1:data1, data2: data2,),
        ),
      );
        },
        child: const Text('Buscar'),
      ),
    );
  }
}
