// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_word.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListWordAdapter extends TypeAdapter<ListWord> {
  @override
  final int typeId = 1;

  @override
  ListWord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListWord(
      abjadBugis: fields[0] as String,
      abjadIndonesia: fields[1] as String,
      bugis: fields[2] as String,
      indonesia: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ListWord obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.abjadBugis)
      ..writeByte(1)
      ..write(obj.abjadIndonesia)
      ..writeByte(2)
      ..write(obj.bugis)
      ..writeByte(3)
      ..write(obj.indonesia);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListWordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
