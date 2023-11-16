// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_local_body.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLocalBodyAdapter extends TypeAdapter<UserLocalBody> {
  @override
  final int typeId = 0;

  @override
  UserLocalBody read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLocalBody(
      name: fields[1] as String?,
      username: fields[3] as String?,
      email: fields[2] as String?,
      id: fields[0] as int?,
      phone: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserLocalBody obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocalBodyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
