import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget detay(String baslik,String icerik,{String arka_renk:"",String on_renk:""}){
return Row(
  children: [
    Container(
      width: 150,
      height: 45,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.black,
        borderRadius:
        BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12),)
      ),
      child: AutoSizeText(baslik,style: GoogleFonts.quicksand(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),maxLines: 1,),
    ),
    Expanded(
      child: Container(
        height: 45,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12),)
        ),
        child: AutoSizeText(icerik,
          style: GoogleFonts.quicksand(color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        maxLines: 1,
        ),
      ),
    ),

  ],
);
}

