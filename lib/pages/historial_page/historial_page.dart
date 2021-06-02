import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hair_beauty/entities/worker.dart';
import 'package:hair_beauty/pages/agendar_cita_page/agendar_cita_page.dart';
import 'package:hair_beauty/pages/welcome_page/welcome_page.dart';
import 'package:hair_beauty/providers/citas_provider.dart';

import 'historial_provider.dart';

class HistorialPageScreen extends StatefulWidget {
  static String id = "history_page";

  HistorialPageScreen();

  @override
  _HistorialPageScreenState createState() => _HistorialPageScreenState();
}

class _HistorialPageScreenState extends State<HistorialPageScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  GlobalKey<FormState> keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7c78f5),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        children: <Widget>[
          Center(child: _crearTitulo()),
          Divider(color: Colors.white70),
          HistorialDataProvider(),
          Divider(color: Colors.white54),
        ],
      ),
    );
  }

  Widget _crearTitulo() {
    return Text(
      'Historial',
      style: GoogleFonts.pacifico(
        color: Color(0xff7c78f5),
        fontSize: 40,
      ),
    );
  }

}
