// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_sentence.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListSentenceAdapter extends TypeAdapter<ListSentence> {
  @override
  final int typeId = 1;

  @override
  ListSentence read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListSentence(
      bugis: fields[0] as String,
      indonesia: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ListSentence obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.bugis)
      ..writeByte(1)
      ..write(obj.indonesia);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListSentenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
