import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hair_beauty/entities/worker.dart';
import 'package:hair_beauty/pages/agendar_cita_page/agendar_cita_page.dart';
import 'package:hair_beauty/pages/welcome_page/welcome_page.dart';
import 'package:hair_beauty/providers/citas_provider.dart';
import 'package:intl/intl.dart';

class ResumePageScreen extends StatefulWidget {
  static String id = "resume_page";
  final List<Worker> workers;
  final String dateSelected;

  ResumePageScreen({@required this.workers, @required this.dateSelected});

  @override
  _ResumePageScreenState createState() => _ResumePageScreenState();
}

class _ResumePageScreenState extends State<ResumePageScreen> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  GlobalKey<FormState> keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    final ResumePageScreen args =
        ModalRoute.of(context).settings.arguments as ResumePageScreen;
    List<Worker> workers = args.workers;
    String dateSelected = args.dateSelected.substring(0, 19);

    int total = 0;
    workers.forEach((element) { total += element.servicio.precio;});

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7c78f5),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        children: <Widget>[
          Center(child: _crearTitulo()),
          Divider(color: Colors.white70),
          _crearResumen(workers, dateSelected, total),
          Divider(color: Colors.white54),
          GestureDetector(
            onTap: () async {

              int idRef = await citasProvider.getNextIdRef();
              await _firestore.collection("citas").add({
                "fecha": dateSelected,
                "idRel": idRef,
                "total": total,
                "user": _auth.currentUser.email
              });

              for (Worker worker in workers) {
                await _firestore.collection("rel_serv_worker").add({
                  "empleado": worker.workerId,
                  "idRel": idRef,
                  "servicio": worker.servicio.serviceId
                });
              }

              Navigator.pushNamed(
                context,
                WelcomeScreen.id,
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: 30.0, top: 20.0, right: 30.0, bottom: 20.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(colors: [
                  Color(0xff7c78f5),
                  Color(0xff7c78f5),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Confirmar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(
                  left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AgendarCitaScreen.id,
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: 30.0, top: 10.0, right: 30.0, bottom: 10.0),
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
              padding: EdgeInsets.only(
                  left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearTitulo() {
    return Text(
      'Resumen',
      style: GoogleFonts.pacifico(
        color: Color(0xff7c78f5),
        fontSize: 40,
      ),
    );
  }

  Column servicesList(List<Worker> workers) {
    List<Widget> listElements = [];

    for (Worker worker in workers) {
      listElements.add(ListTile(
        leading: Icon(
          Icons.check_outlined,
          color: Color(0xff7c78f5),
        ),
        title: Text("${worker.servicio.nombre} | ${worker.nombre} \$ ${worker.servicio.precio}.00"),
      ));
    }

    return Column(
      children: listElements,
    );
  }

  Widget _crearResumen(List<Worker> workers, String dateSelected, int total) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: Color(0xff7c78f5),
            ),
            title: Text('Fecha: ${dateSelected.substring(0, 10)}'),
          ),
          ListTile(
            leading: Icon(
              Icons.access_time_sharp,
              color: Color(0xff7c78f5),
            ),
            title: Text('Hora:   ${dateSelected.substring(11)}'),
          ),
          servicesList(workers),
          Divider(color: Color(0xff7c78f5)),
          ListTile(
            leading: Icon(
              Icons.attach_money_sharp,
              color: Color(0xff7c78f5),
            ),
            title: Text('Total \$ $total.00'),
          ),
          // Divider(color: Colors.white),
        ],
      ),
    );
  }
}
