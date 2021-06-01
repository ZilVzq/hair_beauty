import 'package:flutter/material.dart';
import 'package:hair_beauty/entities/service.dart';
import 'package:hair_beauty/entities/worker.dart';
import 'package:hair_beauty/pages/agendar_cita_page/agendar_cita_page.dart';
import 'package:hair_beauty/pages/welcome_page/welcome_page.dart';
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

  @override
  void initState() {
    super.initState();
  }

  GlobalKey<FormState> keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var unitWidth = media.size.width / 100;
    var unitHeight = media.size.height / 100;
    final ResumePageScreen args =
    ModalRoute.of(context).settings.arguments as ResumePageScreen;
    List<Worker> workers = args.workers;
    String dateSelected = args.dateSelected.substring(0, 19);

    print(workers.length);
    print(dateSelected);



    return Scaffold(

      appBar: AppBar(
        title: Text("\t \t \t \t \t \t \t \t Resumen"),
        backgroundColor: Color(0xff7c78f5),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: unitHeight * 5, right: unitWidth * 10, left: unitWidth * 10),
        child: IntrinsicHeight(
          child: Column(children: [
            Container(height: unitHeight * 40 , width: unitWidth * 80, child: Text("\t Resumen"), color: Colors.yellow),
            Container( color: Colors.blue),
            Container( color: Colors.cyanAccent),
            Container( color: Colors.pink),
            Container( color: Colors.lightGreen),
            Container( color: Colors.cyan),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  WelcomeScreen.id,
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0, bottom: 5.0),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  gradient: LinearGradient(colors: [
                    Color(0xff7c78f5),
                    Color(0xffa2b9ed),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Text("Confirmar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500)),
                padding: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
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
                margin: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0, bottom: 10.0),
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
                padding: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
