// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_data_structure.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendWorshipLogAdapter extends TypeAdapter<AttendWorshipLog> {
  @override
  final int typeId = 0;

  @override
  AttendWorshipLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendWorshipLog(
      fields[0] as DateTime,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AttendWorshipLog obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.dallanteu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttendWorshipLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WriteQtTestimonialLogAdapter extends TypeAdapter<WriteQtTestimonialLog> {
  @override
  final int typeId = 1;

  @override
  WriteQtTestimonialLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WriteQtTestimonialLog(
      fields[0] as DateTime,
      fields[1] as String,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WriteQtTestimonialLog obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.qt_testimonial)
      ..writeByte(2)
      ..write(obj.dallanteu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WriteQtTestimonialLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
