import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid/responsive_grid.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var unitWidth = media.size.width / 100;
    var unitHeight = media.size.height / 100;

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        backgroundColor: animation.value,
        body: Container(


          decoration: BoxDecoration(

            image: DecorationImage(
              image: AssetImage("imagen/fondo2.png"),
              fit: BoxFit.cover,
            ),


            /*gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffffffff),
                  Color(0xffffffff),
                  Color(0xffffffff),
                ]),*/



          ),


          child: ResponsiveGridRow(children: [


            ResponsiveGridCol(
              lg: 12,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color:  const Color (0xffffffff),
                //child: Text("lg : 12"),
                child: Text("Mersy`s",style: GoogleFonts.pacifico(fontStyle: FontStyle.italic, fontSize: 35, textStyle: TextStyle(color:  const Color (0xff9a9ce9))), ),
              ),
            ),

            ResponsiveGridCol(
              xs: 6,
              md: 11,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color:  const Color (0xffa3dcef),
                      borderRadius: new BorderRadius.circular(35.0)
                  ),
                  height: 100,
                  alignment: Alignment(0, 0),
                  child: Text("Agendar\rCita",style: GoogleFonts.pacifico(fontStyle: FontStyle.italic, fontSize: 30, textStyle: TextStyle(color:  const Color (0xffffffff))), ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 11,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color:  const Color (0xffa2b9ed),
                      borderRadius: new BorderRadius.circular(35.0)
                  ),
                  height: 100,
                  alignment: Alignment(0, 0),
                  child: Text("Calendario",style: GoogleFonts.pacifico(fontStyle: FontStyle.italic, fontSize: 30, textStyle: TextStyle(color:  const Color (0xffffffff))), ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 11,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color:  const Color (0xffaeeee0),
                      borderRadius: new BorderRadius.circular(35.0)
                  ),
                  height: 100,
                  alignment: Alignment(0, 0),
                  child: Text("Servicios",style: GoogleFonts.pacifico(fontStyle: FontStyle.italic, fontSize: 30, textStyle: TextStyle(color:  const Color (0xffffffff))), ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 11,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color:  const Color (0xff9a9ce9),
                      borderRadius: new BorderRadius.circular(35.0)
                  ),
                  height: 100,
                  alignment: Alignment(0, 0),
                  child: Text("Trabajadores",style: GoogleFonts.pacifico(fontStyle: FontStyle.italic, fontSize: 30, textStyle: TextStyle(color:  const Color (0xffffffff))), ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 11,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color:  const Color (0xff62decd),
                      borderRadius: new BorderRadius.circular(35.0)
                  ),
                  height: 100,
                  alignment: Alignment(0, 0),
                  child: Text("Ubicación",style: GoogleFonts.pacifico(fontStyle: FontStyle.italic, fontSize: 30, textStyle: TextStyle(color:  const Color (0xffffffff))), ),
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 11,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color:  const Color (0xff7c78f5),
                      borderRadius: new BorderRadius.circular(35.0)
                  ),
                  height: 100,
                  alignment: Alignment(0, 0),
                  //child: Text("xs : 6 \r\nmd : 3"),
                  child: Text("Historial",style: GoogleFonts.pacifico(fontStyle: FontStyle.italic, fontSize: 30, textStyle: TextStyle(color:  const Color (0xffffffff))), ),

                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
