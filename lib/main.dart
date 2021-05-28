import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hair_beauty/pages/agendar_cita_page/agendar_cita_page.dart';
import 'package:hair_beauty/pages/agendar_cita_page/widgets/reume_page.dart';
import 'package:hair_beauty/pages/calendario_page/calendario_page.dart';
import 'package:hair_beauty/pages/login_page/login.dart';
import 'package:hair_beauty/pages/servicios_page/servicios_page.dart';
import 'package:hair_beauty/pages/trabajadores_page/trabajadores_page.dart';
import 'package:hair_beauty/pages/ubicacion_page/ubicacion_page.dart';
import 'package:hair_beauty/pages/welcome_page/welcome_page.dart';
import 'package:hair_beauty/pages/registrar_page/registrar_page.dart';


void main() {
  runApp(HairBeauty());
}

class HairBeauty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        AgendarCitaScreen.id: (context) => AgendarCitaScreen(),
        ResumePageScreen.id: (context) => ResumePageScreen(),
        CalendarioScreen.id: (context) => CalendarioScreen(),
        ServiciosScreen.id: (context) => ServiciosScreen(),
        TrabajadoresScreen.id: (context) => TrabajadoresScreen(),
        UbicacionScreen.id: (context) => UbicacionScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrarScreen.id: (context) => RegistrarScreen()
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), // Spanish, no country code
      ],
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

    );

  }
}