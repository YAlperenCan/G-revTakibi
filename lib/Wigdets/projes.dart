import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorevtakibi/pages/Projeolusturma.dart';

import '../pages/DetaySayfa.dart';

class projes extends StatelessWidget {
  const projes({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    String aktiflik="normal";

    if(data["durum"]=="acil"){
      aktiflik="acil";
    };

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(right: 20,left: 20,top: 20,bottom: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: 2),
        borderRadius: BorderRadius.circular(15),
        color: data['durum'] =="acil" ? Colors.red.shade500: Colors.transparent

      ),

      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: AutoSizeText("${data['kişi']}",style:
              GoogleFonts.bebasNeue(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
              maxLines: 1,
              ),
            ),
            padding: EdgeInsets.all(8),
            width: 70,
            height: 70,
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 230,
                child: AutoSizeText(
                  maxLines: 1,
                  "${data['görev']}",style: GoogleFonts.aBeeZee(
                  fontSize: 20,

                ),),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${data['başlangıçZ']}",style: GoogleFonts.aBeeZee(
                  ),),
                  Container(height: 5,width: 5,
                    margin: EdgeInsets.only(left: 5,right: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),

                  ),
                  Text("${data['bitişZ']}",style: GoogleFonts.aBeeZee(

                  ),),

                ],
              )
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {Navigator.push(context,MaterialPageRoute(
                  builder: (context) => DetaySayfa(data: data),
                ),);},
                icon: Center(
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.indigo,
                    size: 50,
                  ),
                ),
                padding: EdgeInsets.only(bottom: 10),
              ),
            ),
          )


        ],
      ),



    );
  }
}