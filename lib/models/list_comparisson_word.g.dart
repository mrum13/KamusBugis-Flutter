// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_comparisson_word.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListComparissonWordAdapter extends TypeAdapter<ListComparissonWord> {
  @override
  final int typeId = 1;

  @override
  ListComparissonWord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListComparissonWord(
      bugisPinrang: fields[0] as String,
      bugisUmum: fields[1] as String,
      indonesia: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ListComparissonWord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bugisPinrang)
      ..writeByte(1)
      ..write(obj.bugisUmum)
      ..writeByte(2)
      ..write(obj.indonesia);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListComparissonWordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
