import 'package:dallanteu/confirm_affiliation_screen.dart';
import 'package:flutter/material.dart';

class GuideScreen extends StatefulWidget {
  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40.0),
              Container(
                width: 300.0,
                height: 300.0,
                color: Colors.red,
              ),
              const SizedBox(height: 40.0),
              Container(
                width: double.infinity,
                height: 1000.0,
                color: Colors.blue,
              ),
              const SizedBox(height: 40.0),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmAffiliationScreen()),
                  );
                },
                child: Text("[ 시작하기 ]"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}