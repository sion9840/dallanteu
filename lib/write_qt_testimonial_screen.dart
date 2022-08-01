import 'package:dallanteu/hive_data_structure.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:dallanteu/main_screen.dart';

class WriteQtTestimonialScreen extends StatefulWidget {
  @override
  _WriteQtTestimonialScreenState createState() => _WriteQtTestimonialScreenState();
}

class _WriteQtTestimonialScreenState extends State<WriteQtTestimonialScreen> {
  var qt_testimonial = TextEditingController();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QT 소감문 작성 (+ 5 달란트)"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("QT를 한 후, 소감문을 작성하세요 (최소 50자)"),
              Text(
                "*QT 소감문 기록은 남습니다",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 40.0),
              TextField(
                controller: qt_testimonial,
                maxLines: null,
                maxLength: 200,
                decoration: InputDecoration(
                  labelText: "QT 소감문",
                  hintText: "QT 소감문을 작성해주세요",
                  errorText: validate ? "${qt_testimonial.text.length}/50자" : null,
                ),
              ),
              const SizedBox(height: 40.0),
              TextButton(
                onPressed: (){
                  if(qt_testimonial.text.length < 50){
                    setState(() {
                      validate = true;
                    });
                    return;
                  }

                  Hive.box("user").put(
                      "write_qt_testimonial_log",
                      Hive.box("user").get("write_qt_testimonial_log") + [
                        WriteQtTestimonialLog(
                          DateTime.now(),
                          qt_testimonial.text,
                          5,
                        ),
                      ]
                  );
                  Hive.box("user").put(
                    "dallanteu",
                    Hive.box("user").get("dallanteu") + 5,
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
                              new Text("QT 소감문 작성"),
                            ],
                          ),
                          //
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "5 달란트를 얻었습니다!",
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
                child: Text("[ 확인 ]"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}