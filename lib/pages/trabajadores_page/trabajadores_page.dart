import 'dart:ui';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class TrabajadoresScreen extends StatefulWidget {
  static const String id = "trabajadores_screen";

  @override
  _TrabajadoresScreenState createState() => _TrabajadoresScreenState();
}

class _TrabajadoresScreenState extends State<TrabajadoresScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _HomeBoddy()
        ],

      ),
    );

  }
}

class _HomeBoddy extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff7c78f5),
          title: Center(child: Text('Agendar Cita')),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(40.0),

          ),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
