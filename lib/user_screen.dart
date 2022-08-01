import 'package:dallanteu/hive_data_structure.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:dallanteu/main_screen.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int dallanteu = Hive.box("user").get("dallanteu");

  @override
  Widget build(BuildContext context) {
    List<AttendWorshipLog> attend_worship_log = Hive.box("user").get("attend_worship_log");
    List<WriteQtTestimonialLog> write_qt_testimonial_log = Hive.box("user").get("write_qt_testimonial_log");
    List<CalendarEventData> events = [];

    attend_worship_log.forEach(
      (i) {
        events.add(
          CalendarEventData(
            date: i.date,
            title: "예배 출석",
            description: "*${i.dallanteu} 달란트를 얻었습니다",
          )
        );
      }
    );
    write_qt_testimonial_log.forEach(
      (i) {
        events.add(
          CalendarEventData(
            date: i.date,
            title: "QT 소감문 작성",
            description: "*${i.dallanteu} 달란트를 얻었습니다\n${i.qt_testimonial}",
          )
        );
      }
    );

    CalendarControllerProvider.of(context).controller.addAll(events);

    return Scaffold(
      appBar: AppBar(
        title: Text("나"),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (BuildContext context) =>
                    MainScreen()), (route) => false);
          },
        ),
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
            MonthView(
              controller: EventController(),
            ),
          ],
        ),
      ),
    );
  }
}