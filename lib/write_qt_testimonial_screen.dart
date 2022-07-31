import 'package:dallanteu/main_screen.dart';
import 'package:flutter/material.dart';

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
        title: Text("QT 소감문 작성"),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("QT를 한 후, 소감문을 작성하세요 (최소 50자)"),
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
          ],
        ),
      ),
    );
  }
}