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

          ],
        ),
      ),
    );
  }
}