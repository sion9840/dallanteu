import 'dart:html';

import 'package:dallanteu/hive_data_structure.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:table_calendar/table_calendar.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int dallanteu = Hive.box("user").get("dallanteu");
  Map<DateTime ,AttendWorshipLog> attend_worship_log = Hive.box("user").get("attend_worship_log");
  Map<DateTime, WriteQtTestimonialLog> write_qt_testimonial_log = Hive.box("user").get("write_qt_testimonial_log");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("나"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${dallanteu} 달란트",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 40.0),
            TableCalendar(
              firstDay: DateTime.utc(2006, 06, 11),
              lastDay: DateTime.now(),
              focusedDay: DateTime.now(),
              locale: 'ko-KR',
              daysOfWeekHeight: 30,
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  switch(day.weekday){
                    case 1:
                      return Center(child: Text('월'),);
                    case 2:
                      return Center(child: Text('화'),);
                    case 3:
                      return Center(child: Text('수'),);
                    case 4:
                      return Center(child: Text('목'),);
                    case 5:
                      return Center(child: Text('금'),);
                    case 6:
                      return Center(child: Text('토'),);
                    case 7:
                      return Center(child: Text('일',style: TextStyle(color: Colors.red),),);
                  }
                },
              ),
              eventLoader: (dateTime) {
                DateTime now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,);

                if(attend_worship_log.keys.contains(now)){
                  return [Event("Good")];
                }
                else{
                  return [];
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}