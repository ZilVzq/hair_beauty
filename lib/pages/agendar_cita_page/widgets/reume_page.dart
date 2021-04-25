import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResumePageScreen extends StatefulWidget {
  static String id = "resume_page";
  final services;
  final workers;

  ResumePageScreen({Key key, @required this.services, @required this.workers})
      : super(key: key);

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
    final ResumePageScreen args =
        ModalRoute.of(context).settings.arguments as ResumePageScreen;
    var services = args.services;
    var workers = args.workers;

    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba"),
      ),
      body: Table(
        children: [
          TableRow(children: [
            Text(services.toString()),
            Text(workers.toString()),
          ]),
        ],
      ),
    );
  }
}
