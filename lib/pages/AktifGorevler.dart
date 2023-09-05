import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorevtakibi/pages/DetaySayfa.dart';
import '../Wigdets/projes.dart';

class AktifGorevler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference gorevlerRef = _firestore.collection('sirket');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar( 
          backgroundColor: Colors.deepPurple.shade400,
          elevation: 0,
          title: Text("Aktif Projeler",
            style: GoogleFonts.quicksand(
                fontSize: 30,
              color: Colors.white
            ),
          ),centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.indigo.shade100,
            child: Column(
              children: [
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
                          return InkWell(
                            onTap: (){
                            },
                            child: projes(data: data),
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



