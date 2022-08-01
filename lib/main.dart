import 'package:dallanteu/hive_data_structure.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:dallanteu/guide_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("user");
  Hive.registerAdapter(AttendWorshipLogAdapter());
  Hive.registerAdapter(WriteQtTestimonialLogAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GuideScreen(),
    );
  }
}