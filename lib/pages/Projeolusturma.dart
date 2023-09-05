import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorevtakibi/Wigdets/yeniProje.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ProjeYonetici.dart';

class ProjeOlusturma extends StatefulWidget {
  final Map<String, dynamic> data;

  const ProjeOlusturma({Key? key, required this.data}) : super(key: key);

  @override
  State<ProjeOlusturma> createState() => _ProjeOlusturmaState();
}

class _ProjeOlusturmaState extends State<ProjeOlusturma> {
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
          title: Text("Proje Oluşturma",style: GoogleFonts.quicksand(fontSize: 30),),
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
                          hintText: "proje-6",
                          hintStyle: GoogleFonts.quicksand(
                            color: Colors.black.withOpacity(0.2)
                          )
                        ),
                        controller: nameController,
                        )),
                      yeniProje("Görev Başlangıç",TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: "2023",
                            hintStyle: GoogleFonts.quicksand(
                                color: Colors.black.withOpacity(0.2)
                            )
                        ),
                        controller: baslangicController,
                      )),
                      yeniProje("Görev Bitiş",TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: "9.7",
                            hintStyle: GoogleFonts.quicksand(
                                color: Colors.black.withOpacity(0.2)
                            )
                        ),
                        controller: bitisController,
                      )),
                      yeniProje("Görev Durumu",TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: "Normal",
                            hintStyle: GoogleFonts.quicksand(
                                color: Colors.black.withOpacity(0.2)
                            )
                        ),
                        controller: durumController,
                      )),
                      yeniProje("Kişi",TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: "Ceren",
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
                            child: Text("Görev Ekle",style:
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
                height: 250,
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
                      hintText: "Açıklama yazabilirsiniz.",
                      hintStyle: GoogleFonts.quicksand(
                          color: Colors.white.withOpacity(0.3)
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
