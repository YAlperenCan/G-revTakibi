import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorevtakibi/Wigdets/yeniProje.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ProjeYonetici.dart';

class ProjeDuzenleme extends StatefulWidget {
  final Map<String, dynamic> data;

  const ProjeDuzenleme({Key? key, required this.data}) : super(key: key);

  @override
  State<ProjeDuzenleme> createState() => _ProjeDuzenlemeState();
}

class _ProjeDuzenlemeState extends State<ProjeDuzenleme> {
  TextEditingController nameController =TextEditingController();
  TextEditingController baslangicController =TextEditingController();
  TextEditingController bitisController =TextEditingController();
  TextEditingController durumController =TextEditingController();
  TextEditingController aciklamaController =TextEditingController();
  TextEditingController kisiController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference gorevlerRef = _firestore.collection('sirket');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade100,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade400,
          title: Text("Proje Düzenleme",style: GoogleFonts.quicksand(fontSize: 30),),
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
                      yeniProje("Görev",TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: widget.data["görev"],
                            hintStyle: GoogleFonts.quicksand(
                                color: Colors.black.withOpacity(0.5)
                            )
                        ),
                        controller: nameController,
                      )),
                      yeniProje("Görev Başlangıç",TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: widget.data["başlangıçZ"],
                            hintStyle: GoogleFonts.quicksand(
                                color: Colors.black.withOpacity(0.5)
                            )
                        ),
                        controller: baslangicController,
                      )),
                      yeniProje("Görev Bitiş",TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: widget.data["bitişZ"],
                            hintStyle: GoogleFonts.quicksand(
                                color: Colors.black.withOpacity(0.5)
                            )
                        ),
                        controller: bitisController,
                      )),
                      yeniProje("Görev Durumu",TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: widget.data["durum"],
                            hintStyle: GoogleFonts.quicksand(
                                color: Colors.black.withOpacity(0.5)
                            )
                        ),
                        controller: durumController,
                      )),
                      yeniProje("Kişi",TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: widget.data["kişi"],
                            hintStyle: GoogleFonts.quicksand(
                                color: Colors.black.withOpacity(0.2)
                            )
                        ),
                        controller: kisiController,
                      )),
                      InkWell(onTap: ()async{

                        Map<String, dynamic>projedata={'görev':nameController.text,
                          'başlangıçZ':baslangicController.text,'bitişZ':bitisController.text,
                          'durum':durumController.text,'açıklama':aciklamaController.text,'kişi':kisiController.text
                        };
                        await gorevlerRef.doc(nameController.text).set(projedata);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProjeYonetici()));
                      },
                          child: Container(
                            margin: EdgeInsets.all(16),
                            padding: EdgeInsets.all(10),
                            child: Text("Projeyi Kaydet",style:
                            GoogleFonts.quicksand(fontSize: 25,fontWeight: FontWeight.bold),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 400,
                height: 200,
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.indigo.shade900
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: widget.data["açıklama"],
                      hintStyle: GoogleFonts.quicksand(
                          color: Colors.white.withOpacity(0.5)
                      )
                  ),
                  style: GoogleFonts.quicksand(color: Colors.white,fontSize: 20
                  ),
                  maxLines: null,
                  controller:aciklamaController,
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
