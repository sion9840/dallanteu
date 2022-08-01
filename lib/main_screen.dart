import 'package:dallanteu/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import 'package:dallanteu/attend_worship_screen.dart';
import 'package:dallanteu/write_qt_testimonial_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String affiliation_code = Hive.box("user").get("affiliation_code");
  int dallanteu = Hive.box("user").get("dallanteu");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40.0),
            Text(
              "${dallanteu} 달란트",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 80.0),
            Builder(
              builder: (BuildContext context) {
                return TextButton(
                  onPressed: () async {
                    var url = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SimpleBarcodeScannerPage(),
                        ));

                    if(url == null){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AttendWorshipScreen()),
                      );
                    }
                    else{
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("예배 출석 QR코드가 아닙니다")));
                    }
                  },
                  child: Text("[ 예배 출석 ]"),
                );
              }
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WriteQtTestimonialScreen()),
                );
              },
              child: Text("[ QT 소감문 작성 ]"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserScreen()),
                );
              },
              child: Text("[ 나 ]"),
            ),
          ],
        ),
      ),
    );
  }
}