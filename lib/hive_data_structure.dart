import 'package:hive/hive.dart';

part 'hive_data_structure.g.dart';

@HiveType(typeId: 0)
class AttendWorshipLog {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int dallanteu;

  AttendWorshipLog(this.date, this.dallanteu);
}

@HiveType(typeId: 1)
class WriteQtTestimonialLog {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String qt_testimonial;

  @HiveField(2)
  int dallanteu;

  WriteQtTestimonialLog(this.date, this.qt_testimonial, this.dallanteu);
}