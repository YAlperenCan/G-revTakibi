import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorevtakibi/Wigdets/detay.dart';
import 'package:flutter/cupertino.dart';

class DetaySayfa extends StatefulWidget {
  final Map<String, dynamic> data;

  const DetaySayfa({Key? key, required this.data}) : super(key: key);

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade100,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepPurple.shade400,
          title: Text("Görev Detay",style: GoogleFonts.quicksand(fontSize: 30),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  padding: EdgeInsets.all(23),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    children: [
                      detay("Görev", widget.data['görev']),
                      detay("Görev Başlangıç", widget.data['başlangıçZ']),
                      detay("Görev Bitiş", widget.data['bitişZ']),
                      detay("Görev durumu", widget.data['durum']),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.indigo.shade900
                ),
                child: Text("${widget.data['açıklama']}",
                style: GoogleFonts.quicksand(color: Colors.white,fontSize: 20
                )),
                ),



            ],
          ),
        ),
      ),
    );
  }
}
