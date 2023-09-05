import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gorevtakibi/pages/KayitOl.dart';
import 'package:gorevtakibi/pages/YoneticiGiris.dart';
import 'package:gorevtakibi/service/Auth.dart';
import '../const/tema.dart';
import 'AktifGorevler.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool goz =false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Tema tema =Tema();
  AuthService _authService = AuthService();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.indigo.shade100, // Arka plan rengi mavi
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(5, 35, 20, 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/logoo.jpg',
                          width: 40.0,
                          height: 40.0,
                        ),
                        SizedBox(width: 10.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Task ',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 38.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF483d8b), // Yazı rengi beyaz

                                ),
                              ),
                              TextSpan(
                                text: 'Manage',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 35.0,
                                  color: Color(0xFF6959cd), // Yazı rengi beyaz
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 85),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF6959cd),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _emailController,
                          style: TextStyle(
                            color: Colors.white,
                          ), // TextStyle
                          cursorColor: Colors.white,
                          decoration:tema.inputDec("E-mail",Icons.mail)
                        ),
                        SizedBox(height: 10.0),
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      rememberMe = !rememberMe;
                                    });
                                  },
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: rememberMe
                                        ? Icon(Icons.check,
                                        color: Colors.white, size: 16)
                                        : null,
                                  ),
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'Beni Hatırla',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 13.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _authService
                                .signIn(
                                _emailController.text, _passwordController.text)
                                .then((value) {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AktifGorevler()));
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0,
                            side: BorderSide(
                                width: 2.0, color: Colors.white), // Kenar çizgisi
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Kenarları yuvarlatılmış
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Giriş Yap',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.bebasNeue(
                                fontSize: 25.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => KayitOl()),
                            );
                            // Login button pressed
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Kayıt Ol',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 13.0,
                                      color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 50,
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {

                               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => YoneticiGiris()));

                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0,
                            side: BorderSide(
                                width: 2.0, color: Colors.white), // Kenar çizgisi
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Kenarları yuvarlatılmış
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'yönetici giriş',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.bebasNeue(
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


