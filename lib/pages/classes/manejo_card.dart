import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ManejoCard extends StatelessWidget {
  const ManejoCard(
      {super.key, required this.title,
      required this.data,
      required this.propriedade,
      required this.tipoES,
      required this.thumbnail,
      required this.pecuaria});

  final String title;
  final String pecuaria;
  final String data;
  final String propriedade;
  final String tipoES;
  final Widget thumbnail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child:Row(
      children: 
        [thumbnail,
       const SizedBox(width: 10),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children:<Widget>[          
              Text(
                'Manejo: ',
                style: GoogleFonts.openSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.openSans(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              ),
            ),
            ],),

            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(
              'Data: $data',
              style: GoogleFonts.headlandOne(fontSize: 12.0,
              fontWeight: FontWeight.bold,),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            Text(
              propriedade,
              style: const TextStyle(fontSize: 12.0,
              fontWeight: FontWeight.bold,),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            Text(
              pecuaria,
              style: const TextStyle(fontSize: 12.0,
              fontWeight: FontWeight.bold,),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            Text(
              tipoES,
              style: tipoES=='ENTRADA'? const TextStyle(fontSize: 12.0,
              fontWeight: FontWeight.bold, color: Colors.green)
              :const TextStyle(fontSize: 12.0,
              fontWeight: FontWeight.bold, color: Colors.red) ,
            )
          ],
        ),
      ],
      ),
    );
  }
}