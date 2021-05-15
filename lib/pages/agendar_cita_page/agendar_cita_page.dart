import 'package:flutter/material.dart';
import 'package:hair_beauty/entities/service.dart';
import 'package:hair_beauty/entities/worker.dart';
import 'package:hair_beauty/pages/agendar_cita_page/widgets/reume_page.dart';
import 'package:hair_beauty/pages/welcome_page/welcome_page.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class AgendarCitaScreen extends StatefulWidget {
  static String id = "agendar_cita_screen";

  @override
  _AgendarCitaScreenState createState() => _AgendarCitaScreenState();
}

class _AgendarCitaScreenState extends State<AgendarCitaScreen> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  List _selectedServices;
  List _selectedWorkers;
  String _myActivitiesResult;
  var servicesJson = [
    Service(serviceId: 1, nombre: "Corte", precio: 10.11).toJson(),
    Service(serviceId: 2, nombre: "Rapado", precio: 20.11).toJson()
  ];
  var workersJson = [
    Worker(workerId: 1, nombre: "Nombre", apellido: "Apellido").toJson(),
    Worker(workerId: 2, nombre: "Nombre", apellido: "Apellido").toJson()
  ];

  @override
  void initState() {
    super.initState();
    _selectedServices = [];
    _selectedWorkers = [];
    _myActivitiesResult = '';
  }

  GlobalKey<FormState> keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff7c78f5),
          title: Center(child: Text('Agendar Cita')),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(40.0),
            child: Form(
              key: keyForm,
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
        Padding(
          padding: EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0, bottom: 5.0) ,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Seleccionar Fecha y Hora",
                  textAlign: TextAlign.center,
                ),
                DateTimeField(
                  format: format,
                  initialValue: DateTime.now(),
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.combine(date, time);
                    } else {
                      return currentValue;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.0, top: 1.0, right: 0.0, bottom: 1.0),
          child: Card(
            child: MultiSelectFormField(
              title: Text("Servicios"),
              autovalidate: false,
              //titleText: 'My workouts',
              validator: (value) {
                if (value == null || value.length == 0) {
                  return 'Por favor seleccione uno o más servicios';
                } else {
                  return null;
                }
              },
              dataSource: servicesJson,
              textField: 'nombre',
              valueField: 'serviceId',
              okButtonLabel: 'OK',
              cancelButtonLabel: 'CANCEL',
              required: true,
              onSaved: (value) {
                if (value != null) {
                  setState(() {
                    _selectedServices = value;
                    print(_selectedServices);
                  });
                }
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.0, top: 1.0, right: 30.0, bottom: 1.0),
          child: Text(_myActivitiesResult),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 1.0),
          child: Card(
            child: MultiSelectFormField(
              title: Text("Trabajadores"),
              autovalidate: false,
              validator: (value) {
                if (value == null || value.length == 0) {
                  return 'Por favor seleccione uno o más servicios';
                } else {
                  return null;
                }
              },
              dataSource: workersJson,
              textField: 'nombreCompleto',
              valueField: 'workerId',
              okButtonLabel: 'OK',
              cancelButtonLabel: 'CANCEL',
              required: true,
              onSaved: (value) {
                if (value != null) {
                  setState(() {
                    _selectedWorkers = value;
                    print(_selectedWorkers);
                  });
                }
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Text(_myActivitiesResult),
        ),
        GestureDetector(
          onTap: () {
            save();
          },
          child: Container(
            margin: EdgeInsets.only(left: 30.0, top: 1.0, right: 30.0, bottom: 20.0),
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(colors: [
                Color(0xff7c78f5),
                Color(0xffa2b9ed),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Text("Guardar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(left: 0.0, top: 16.0, right: 0.0, bottom: 16.0),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              WelcomeScreen.id,
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 30.0, top: 1.0, right: 30.0, bottom: 1.0),
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(colors: [
                Color(0xff7c78f5),
                Color(0xffa2b9ed),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Text("Cancelar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(left: 0.0, top: 16.0, right: 0.0, bottom: 16.0),
          ),
        ),

      ],
    );
  }

  save() {
    if (keyForm.currentState.validate()) {
      Navigator.pushNamed(
        context,
        ResumePageScreen.id,
        arguments: ResumePageScreen(
            services: _selectedServices,
            workers: _selectedWorkers
        ),
      );
    }
  }
}
