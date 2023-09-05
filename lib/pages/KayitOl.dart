import 'package:flutter/material.dart';
import 'package:gorevtakibi/pages/LoginScreen.dart';
import 'package:gorevtakibi/service/Auth.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/tema.dart';




class KayitOl extends StatefulWidget {
  @override
  _KayitOlState createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  bool rememberMe = false;
  bool goz = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController = TextEditingController();
  Tema tema =Tema();
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade100,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16,right: 16,top: 130),
              decoration: BoxDecoration(
                color: Color(0xFF6959cd),
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    style: TextStyle(
                      color: Colors.white,
                    ), // TextStyle
                    cursorColor: Colors.white,
                    decoration: tema.inputDec("Kullanıcı adı",Icons.person)
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _emailController,
                    style: TextStyle(
                      color: Colors.white,
                    ), // TextStyle
                    cursorColor: Colors.white,
                    decoration: tema.inputDec("E-mail",Icons.mail)
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            controller: _passwordController,
                            style: TextStyle(
                              color: Colors.white,
                            ), // TextStyle
                            cursorColor: Colors.white,
                            obscureText: !goz,
                            decoration: tema.inputDec("Parola",Icons.vpn_key_rounded)
                        ),
                      ),
                      IconButton(onPressed: (){
                        setState(()
                        {
                          goz=!goz;
                        });
                      }, icon: Icon(Icons.remove_red_eye,color: Colors.white54,))
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            controller: _passwordAgainController,
                            style: TextStyle(
                              color: Colors.white,
                            ), // TextStyle
                            cursorColor: Colors.white,
                            obscureText: !goz,
                            decoration: tema.inputDec("Parola Tekrar",Icons.vpn_key_rounded)
                        ),
                      ),
                      IconButton(onPressed: (){
                        setState(()
                        {
                          goz=!goz;
                        });
                      }, icon: Icon(Icons.remove_red_eye,color: Colors.white54,))
                    ],
                  ),
                  SizedBox(height: 35,),
                  InkWell(
                    onTap: () {
                      _authService.createPerson(
                        _nameController.text,
                        _emailController.text,
                        _passwordController.text,
                      ).then((value) {
                        return Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      });
                      // Register button pressed
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.white),
                        gradient: LinearGradient(colors: [
                          Color(0xFF6959cd),Colors.deepPurpleAccent,
                        ]),
                        borderRadius: BorderRadius.circular(20.0), // Kenarları yuvarlatılmış
                      ),
                      child: Text(
                        'Kayıt Ol',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          fontSize: 25.0,
                          color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),


            // Uzaklık eklemek için boşluk bırakıyoruz

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


