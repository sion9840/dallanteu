import 'package:dallanteu/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AttendWorshipScreen extends StatefulWidget {
  @override
  _AttendWorshipScreenState createState() => _AttendWorshipScreenState();
}

class _AttendWorshipScreenState extends State<AttendWorshipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("예배 출석"),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("예배에 출석하시겠습니까?"),
              const SizedBox(height: 80.0),
              TextButton(
                onPressed: (){
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