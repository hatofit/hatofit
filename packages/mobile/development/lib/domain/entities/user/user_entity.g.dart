// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<_$UserEntityImpl> {
  @override
  final int typeId = 0;

  @override
  _$UserEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserEntityImpl(
      id: fields[0] as String?,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      gender: fields[3] as String?,
      email: fields[4] as String?,
      dateOfBirth: fields[5] as DateTime?,
      photo: fields[6] as String?,
      metricUnits: fields[7] as UserMetricUnitsEntity?,
      height: fields[8] as int?,
      weight: fields[9] as int?,
      createdAt: fields[10] as DateTime?,
      updatedAt: fields[11] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserEntityImpl obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.dateOfBirth)
      ..writeByte(6)
      ..write(obj.photo)
      ..writeByte(7)
      ..write(obj.metricUnits)
      ..writeByte(8)
      ..write(obj.height)
      ..writeByte(9)
      ..write(obj.weight)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserMetricUnitsEntityAdapter
    extends TypeAdapter<_$UserMetricUnitsEntityImpl> {
  @override
  final int typeId = 1;

  @override
  _$UserMetricUnitsEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserMetricUnitsEntityImpl(
      energyUnits: fields[0] as String?,
      heightUnits: fields[1] as String?,
      weightUnits: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserMetricUnitsEntityImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.energyUnits)
      ..writeByte(1)
      ..write(obj.heightUnits)
      ..writeByte(2)
      ..write(obj.weightUnits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserMetricUnitsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
