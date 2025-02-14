// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_objects.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataObejctsAdapter extends TypeAdapter<DataObejcts> {
  @override
  final int typeId = 0;

  @override
  DataObejcts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataObejcts()
      ..key = fields[0] as dynamic
      ..name = fields[1] == null ? '' : fields[1] as String
      ..address = fields[2] == null ? '' : fields[2] as String
      ..profileImage = fields[3] as Uint8List
      ..hobbies = fields[4] == null ? [] : (fields[4] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, DataObejcts obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.profileImage)
      ..writeByte(4)
      ..write(obj.hobbies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataObejctsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
