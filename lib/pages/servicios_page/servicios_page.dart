import 'dart:ui';
import 'package:flutter/material.dart';


//class ServiciosScreen extends StatefulWidget {
//  static const String id = "servicios_screen";

//  @override
//  _ServiciosScreenState createState() => _ServiciosScreenState();
//}

//class _ServiciosScreenState extends State<ServiciosScreen>
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class ServiciosScreen extends StatefulWidget {
  static String id = "servicios_screen";

  @override
  _ServiciosScreenState createState() => _ServiciosScreenState();
}

class _ServiciosScreenState extends State<ServiciosScreen> {
  final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Servicios')),
          backgroundColor: Color(0xff7c78f5),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0, bottom: 30.0),
            child: Form(
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget formUI() {
    return Column(
      children: <Widget>[

      ],
    );
  }


  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DateFormat>('format', format));
  }
}
