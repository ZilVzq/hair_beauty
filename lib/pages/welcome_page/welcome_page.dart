import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hair_beauty/pages/agendar_cita_page/agendar_cita_page.dart';
import 'package:hair_beauty/pages/calendario_page/calendario_page.dart';
import 'package:hair_beauty/pages/servicios_page/servicios_page.dart';
import 'package:hair_beauty/pages/ubicacion_page/ubicacion_page.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final _firebase = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  var userData;

  @override
  void initState() {
    super.initState();
    print("El usuario logeado es: " + _auth.currentUser.email);
  }


    readItems() async {
      CollectionReference _productss = _firebase.collection('users');
      var algo = await _productss.where("email", isEqualTo: _auth.currentUser.email).get();
      var elements = algo.docs;
      for(var element in elements){
        print(element.data());
      }
    }



  int sizeBottomWelcome = 6;

  Container welcomeOption(String texto, Color color, double radius, double fontsize, double height, double width, Color fontColor ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          texto.replaceAll(" ", "\n"),
          textAlign: TextAlign.center,
          style: GoogleFonts.pacifico(
            fontStyle: FontStyle.italic,
            fontSize: fontsize,
            textStyle: TextStyle(
              color: fontColor,

            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var unitWidth = media.size.width / 100;
    var unitHeight = media.size.height / 100;
    var sizeForBottom = media.size.height * 1 / sizeBottomWelcome;

    print(media.size.height);
    print(sizeForBottom);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: media.size.width,
          height: media.size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("imagen/fondo2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: welcomeOption("Mersy`s", Color(0xff000000), 0, 40, sizeForBottom , unitWidth * 100, Color(0xffa2b9ed)),
              ),
              Expanded(
                flex: sizeBottomWelcome,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AgendarCitaScreen.id,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(unitWidth * 2.5, unitHeight * 12, unitWidth * 2.5, unitHeight * 0),
                            child: welcomeOption(
                                "Agendar Cita", Color(0xffa3dcef), 35.0, 23, unitHeight * 10, unitWidth * 45, Color(0xffffffff)
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              CalendarioScreen.id,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(unitWidth * 2.5, unitHeight * 12, unitWidth * 2.5, unitHeight * 0),
                            child: welcomeOption(
                                "Calendario", Color(0xffa2b9ed), 35.0, 23, unitHeight * 10, unitWidth * 45, Color(0xffffffff)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ServiciosScreen.id,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(unitWidth * 2.5, unitHeight * 5, unitWidth * 2.5, unitHeight * 0),
                            child: welcomeOption(
                                "Servicios", Color(0xffaeeee0), 35.0, 23, unitHeight * 10, unitWidth * 45, Color(0xffffffff)
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AgendarCitaScreen.id,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(unitWidth * 2.5, unitHeight * 5, unitWidth * 2.5, unitHeight * 0),
                            child: welcomeOption(
                                "Trabajadores", Color(0xff9a9ce9), 35.0, 23, unitHeight * 10, unitWidth * 45, Color(0xffffffff)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              UbicacionScreen.id,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(unitWidth * 2.5, unitHeight * 5, unitWidth * 2.5, unitHeight * 0),
                            child: welcomeOption(
                                "Ubicación", Color(0xff62decd), 35.0, 23, unitHeight * 10, unitWidth * 45, Color(0xffffffff)
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            /*Navigator.pushNamed(
                              context,
                              AgendarCitaScreen.id,
                            );*/
                            readItems();
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(unitWidth * 2.5, unitHeight * 5, unitWidth * 2.5, unitHeight * 0),
                            child: welcomeOption(
                                "Historial", Color(0xff7c78f5), 35.0, 23, unitHeight * 10, unitWidth * 45, Color(0xffffffff)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
