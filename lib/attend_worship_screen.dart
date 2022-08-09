import 'package:dallanteu/hive_data_structure.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:dallanteu/main_screen.dart';

class AttendWorshipScreen extends StatefulWidget {
  @override
  _AttendWorshipScreenState createState() => _AttendWorshipScreenState();
}

class _AttendWorshipScreenState extends State<AttendWorshipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("예배 출석 (+ 10 달란트)"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("예배에 출석하시겠습니까?"),
              const SizedBox(height: 80.0),
              TextButton(
                onPressed: (){
                  DateTime now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,);

                  var attend_worship_log = Hive.box("user").get("attend_worship_log");
                  attend_worship_log.addAll(
                      {
                        now: AttendWorshipLog(
                          now,
                          10,
                        )
                      }
                  );

                  Hive.box("user").put(
                    "attend_worship_log",
                    attend_worship_log,
                  );
                  Hive.box("user").put(
                    "dallanteu",
                    Hive.box("user").get("dallanteu") + 10,
                  );

                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          //Dialog Main Title
                          title: Column(
                            children: <Widget>[
                              new Text("예배 출석"),
                            ],
                          ),
                          //
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "10 달란트를 얻었습니다!",
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("확인"),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MainScreen()), (route) => false);
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text("[ 예 ]"),
              ),
              Text(
                "*예배 출석 기록은 남습니다",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}