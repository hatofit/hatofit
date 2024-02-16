// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionEntityAdapter extends TypeAdapter<_$SessionEntityImpl> {
  @override
  final int typeId = 5;

  @override
  _$SessionEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SessionEntityImpl(
      id: fields[0] as String?,
      userId: fields[1] as String?,
      mood: fields[2] as String?,
      exercise: fields[3] as ExerciseEntity?,
      startTime: fields[4] as int?,
      endTime: fields[5] as int?,
      timelines: (fields[6] as List?)?.cast<SessionTimelineEntity>(),
      data: (fields[7] as List?)?.cast<SessionDataItemEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$SessionEntityImpl obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.mood)
      ..writeByte(3)
      ..write(obj.exercise)
      ..writeByte(4)
      ..write(obj.startTime)
      ..writeByte(5)
      ..write(obj.endTime)
      ..writeByte(6)
      ..write(obj.timelines)
      ..writeByte(7)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SessionTimelineEntityAdapter
    extends TypeAdapter<_$SessionTimelineEntityImpl> {
  @override
  final int typeId = 6;

  @override
  _$SessionTimelineEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SessionTimelineEntityImpl(
      name: fields[0] as String?,
      startTime: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$SessionTimelineEntityImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.startTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionTimelineEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SessionDataItemEntityAdapter
    extends TypeAdapter<_$SessionDataItemEntityImpl> {
  @override
  final int typeId = 7;

  @override
  _$SessionDataItemEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SessionDataItemEntityImpl(
      second: fields[0] as int?,
      timeStamp: fields[1] as int?,
      devices: (fields[2] as List?)?.cast<SessionDataItemDeviceEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$SessionDataItemEntityImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.second)
      ..writeByte(1)
      ..write(obj.timeStamp)
      ..writeByte(2)
      ..write(obj.devices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionDataItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SessionDataItemDeviceEntityAdapter
    extends TypeAdapter<_$SessionDataItemDeviceEntityImpl> {
  @override
  final int typeId = 8;

  @override
  _$SessionDataItemDeviceEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SessionDataItemDeviceEntityImpl(
      type: fields[0] as String?,
      identifier: fields[1] as String?,
      value: (fields[2] as List?)
          ?.map((dynamic e) => (e as Map).cast<String, dynamic>())
          ?.toList(),
      brand: fields[3] as String?,
      model: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$SessionDataItemDeviceEntityImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.identifier)
      ..writeByte(3)
      ..write(obj.brand)
      ..writeByte(4)
      ..write(obj.model)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionDataItemDeviceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
