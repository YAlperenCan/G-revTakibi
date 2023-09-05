import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorevtakibi/pages/DetaySayfa.dart';
import 'package:gorevtakibi/pages/ProjeDuzenleme.dart';
import 'package:gorevtakibi/pages/Projeolusturma.dart';
import '../Wigdets/projes.dart';

class ProjeYonetici extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    final _firestore = FirebaseFirestore.instance;
    CollectionReference gorevlerRef = _firestore.collection('sirket');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar( 
          backgroundColor: Colors.deepPurple.shade400,
          elevation: 0,
          title: Text("Aktif Projeler Yönetici",
            style: GoogleFonts.quicksand(
                fontSize: 30,
                color: Colors.white
            ),
          ),centerTitle: true,
        ),
        body: Container(
          color: Colors.indigo.shade100,
          child: SafeArea(
            child: Column(
              children: [
            Container(
              margin: EdgeInsets.only(top: 16,bottom: 5),
              child: StreamBuilder<QuerySnapshot>(
              stream: gorevlerRef.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                if (asyncSnapshot.hasError) {
                  return Text('Veriler alınırken bir hata oluştu.');
                }
                if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                List<DocumentSnapshot> ListofDS = asyncSnapshot.data!.docs;
                Map<String, dynamic> data = ListofDS.isNotEmpty
                    ? ListofDS.first.data() as Map<String, dynamic>
                    : {};

                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (data.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProjeOlusturma(data: data)));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      side: BorderSide(width: 2.0, color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Container(
                      width: 250,
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Proje Oluştur',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
          ),
            ),
                StreamBuilder<QuerySnapshot>(
                  stream: gorevlerRef.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Text('Veriler alınırken bir hata oluştu.');
                    }
                    if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    List<DocumentSnapshot> ListofDS = asyncSnapshot.data!.docs;

                    return Flexible(
                      child: ListView.builder(
                        itemCount: ListofDS.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data = ListofDS[index].data() as Map<String, dynamic>;
                          String aktiflik="normal";
                          if(data["durum"]=="acil"){
                            aktiflik="acil";
                          };
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 0),
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
                                      width: 60,
                                      height: 60,
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
                                            IconButton(onPressed: (){
                                              ListofDS[index].reference.delete();

                                            }, icon: Icon(Icons.delete)),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => ProjeDuzenleme(data: data),
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.edit), // Düzeltme ikonu olarak "Edit" ikonu kullanılıyor
                                            ),
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
                                              size: 40,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(bottom: 10),
                                        ),
                                      ),
                                    )


                                  ],
                                ),



                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}



