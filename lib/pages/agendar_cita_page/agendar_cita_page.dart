import 'package:flutter/material.dart';
import 'package:hair_beauty/entities/service.dart';
import 'package:hair_beauty/entities/worker.dart';
import 'package:hair_beauty/pages/agendar_cita_page/widgets/reume_page.dart';
import 'package:hair_beauty/pages/welcome_page/welcome_page.dart';
import 'package:hair_beauty/providers/services_provider.dart';
import 'package:hair_beauty/providers/workers_provider.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class AgendarCitaScreen extends StatefulWidget {
  static String id = "agendar_cita_screen";

  @override
  _AgendarCitaScreenState createState() => _AgendarCitaScreenState();
}

class _AgendarCitaScreenState extends State<AgendarCitaScreen> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  List<Worker> _selectedWorkersServices = new List();
  List<Worker> workers = new List();
  String _myActivitiesResult;
  var servicesJson = [];
  var dateSelected;

  @override
  void initState() {
    super.initState();

    int cont = 0;
    for (Worker worker in workersProvider.workersList) {
      for (var service in worker.servicios) {
        if (worker.servicios.contains(service)) {
          Worker tempWorker = new Worker(
              workerId: worker.workerId,
              nombre: worker.nombre,
              apellido: worker.apellido);
          Service serviceTemp = servicesProvider.servicesList
              .firstWhere((element) => element.serviceId == service);
          tempWorker.servicio = serviceTemp;
          tempWorker.servicioId = service;
          tempWorker.idTupla = ++cont;
          workers.add(tempWorker);
        }
      }
    }
    for (Worker worker in workers) {
      servicesJson.add(worker.toJson());
    }
    _myActivitiesResult = '';
  }

  GlobalKey<FormState> keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
            child: Form(
              key: keyForm,
              child: formUI(),
            ),
          ),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }

  Widget formUI() {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0, bottom: 5.0),
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
                      dateSelected = DateTimeField.combine(date, time);
                      return DateTimeField.combine(date, time);
                    } else {
                      dateSelected = currentValue;
                      return currentValue;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 0.0, top: 1.0, right: 0.0, bottom: 1.0),
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
              textField: 'infoToShow',
              valueField: 'idTupla',
              okButtonLabel: 'OK',
              cancelButtonLabel: 'CANCEL',
              required: true,
              onSaved: (value) {
                if (value != null) {
                  setState(() {
                    for (var selectedTupla in value) {
                      Worker worker = workers.firstWhere(
                          (element) => element.idTupla == selectedTupla);
                      _selectedWorkersServices.add(worker);
                    }
                  });
                }
              },
            ),
          ),
        ),
        Container(
          padding:
              EdgeInsets.only(left: 30.0, top: 1.0, right: 30.0, bottom: 1.0),
          child: Text(_myActivitiesResult),
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
            margin: EdgeInsets.only(
                left: 30.0, top: 1.0, right: 30.0, bottom: 20.0),
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(colors: [
                Color(0xff7c78f5),
                Color(0xff7c78f5),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Text("Guardar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500)),
            padding:
                EdgeInsets.only(left: 0.0, top: 16.0, right: 0.0, bottom: 16.0),
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
            margin:
                EdgeInsets.only(left: 30.0, top: 1.0, right: 30.0, bottom: 1.0),
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(colors: [
                Color(0xff7c78f5),
                Color(0xff7c78f5),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Text("Cancelar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500)),
            padding:
                EdgeInsets.only(left: 0.0, top: 16.0, right: 0.0, bottom: 16.0),
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
          workers: _selectedWorkersServices,
          dateSelected: dateSelected.toString(),
        ),
      );
    }
  }
}
