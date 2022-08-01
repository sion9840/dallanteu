import 'package:dallanteu/hive_data_structure.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:dallanteu/main_screen.dart';

class ConfirmAffiliationScreen extends StatefulWidget {
  @override
  _ConfirmAffiliationScreenState createState() => _ConfirmAffiliationScreenState();
}

class _ConfirmAffiliationScreenState extends State<ConfirmAffiliationScreen> {
  var user_code = TextEditingController();
  bool validate = false;
  List<String> affiliation_codes = ["S1DB83"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40.0),
            Text(
              "잠시만요,\n소속이 어디신가요?",
              style: TextStyle(
                fontSize: 36.0,
              ),
            ),
            const SizedBox(height: 80.0),
            TextField(
              decoration: InputDecoration(
                hintText: "소속 코드를 입력해주세요",
                labelText: "소속 코드",
                errorText: validate ? "옳바른 소속 코드를 입력해주세요" : null,
              ),
              controller: user_code,
            ),
            const SizedBox(height: 40.0),
            TextButton(
              onPressed: (){
                if(affiliation_codes.contains(user_code.text)){
                  setState(() {
                    validate = false;
                  });

                  Hive.box("user").put("affiliation_code", user_code.text);
                  Hive.box("user").put("dallanteu", 100);
                  Hive.box("user").put("attend_worship_log", <AttendWorshipLog>[]);
                  Hive.box("user").put("write_qt_testimonial_log", <WriteQtTestimonialLog>[]);

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MainScreen()), (route) => false);
                }
                else{
                  setState(() {
                    validate = true;
                  });
                }
              },
              child: Text("[ 확인 ]"),
            ),
          ],
        ),
      ),
    );
  }
}