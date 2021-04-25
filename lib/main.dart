import 'package:flutter/material.dart';
import 'package:hair_beauty/agendar_cita_page/agendar_cita_page.dart';
import 'package:hair_beauty/calendario_page/calendario_page.dart';
import 'package:hair_beauty/servicios_page/servicios_page.dart';
import 'package:hair_beauty/trabajadores_page/trabajadores_page.dart';
import 'package:hair_beauty/ubicacion_page/ubicacion_page.dart';
import 'package:hair_beauty/welcome_page/welcome_page.dart';

void main() {
  runApp(HairBeauty());
}

class HairBeauty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
        routes: {
          AgendarCitaScreen.id: (context) => AgendarCitaScreen(),
          CalendarioScreen.id: (context) => CalendarioScreen(),
          ServiciosScreen.id: (context) => ServiciosScreen(),
          TrabajadoresScreen.id: (context) => TrabajadoresScreen(),
          //TrabajadorScreen.id: (context) => TrabajadorScreen(),
          UbicacionScreen.id: (context) => UbicacionScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
        },
    );
  }
}