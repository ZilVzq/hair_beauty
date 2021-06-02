import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hair_beauty/entities/cita_dto.dart';
import 'package:hair_beauty/entities/worker_service.dart';
import 'package:hair_beauty/providers/citas_provider.dart';

class HistorialDataProvider extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  HistorialDataProvider();

  @override
  Widget build(BuildContext context) {

    Column servicesList(List<WorkerService> elements) {
      List<Widget> listElements = [];

      for (WorkerService element in elements) {
        listElements.add(ListTile(
          leading: Icon(
            Icons.check_outlined,
            color: Color(0xff7c78f5),
          ),
          title: Text("${element.service.nombre} | ${element.worker.nombre} \$ ${element.service.precio}.00"),
        ));
      }

      return Column(
        children: listElements,
      );
    }

    Widget _createCardResume(List<WorkerService> subList){
      return Card(
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Color(0xff7c78f5),
              ),
              title: Text('Fecha: ${subList[0].cita.fecha.substring(0, 10)}'),
            ),
            ListTile(
              leading: Icon(
                Icons.access_time_sharp,
                color: Color(0xff7c78f5),
              ),
              title: Text('Hora:   ${subList[0].cita.fecha.substring(11)}'),
            ),
            servicesList(subList),
            Divider(color: Color(0xff7c78f5)),
            ListTile(
              leading: Icon(
                Icons.attach_money_sharp,
                color: Color(0xff7c78f5),
              ),
              title: Text('Total \$ ${subList[0].cita.total}.00'),
            ),
            // Divider(color: Colors.white),
          ],
        ),
      );
    }

    Widget _crearResumen(List<WorkerService> listElements) {
      List<Widget> dataColumn = [];
      for(int ref in citasProvider.referencesList){
        List<WorkerService> subList = listElements.where((element) => element.idRef == ref).toList();
        dataColumn.add(_createCardResume(subList));
      }
      return Column(
        children: dataColumn,
      );
    }


    return FutureBuilder<List<WorkerService>>(
      future: citasProvider.getCitasByEmail(_auth.currentUser.email),
      builder: (BuildContext context, AsyncSnapshot<List<WorkerService>> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && snapshot.data.length < 1) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return _crearResumen(snapshot.data);
        }

        return Text("loading");
      },
    );
  }
}

