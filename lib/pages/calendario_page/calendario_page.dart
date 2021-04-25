import 'dart:ui';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarioScreen extends StatefulWidget {
  static const String id = "calendario_screen";

  @override
  _CalendarioScreenState createState() => _CalendarioScreenState();
}

class _CalendarioScreenState extends State<CalendarioScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SfCalendar(
            view: CalendarView.month,
            todayHighlightColor: Color(0xff7c78f5),
            monthViewSettings: MonthViewSettings(
              showAgenda: true,
              agendaStyle: AgendaStyle(
                backgroundColor: Color(0xff000000),
                appointmentTextStyle: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Color(0xffa2b9ed),
                ),
                dateTextStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffa2b9ed),
                ),
                dayTextStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffa2b9ed),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
