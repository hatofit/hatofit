// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportEntityAdapter extends TypeAdapter<_$ReportEntityImpl> {
  @override
  final int typeId = 8;

  @override
  _$ReportEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ReportEntityImpl(
      id: fields[0] as String?,
      sessionId: fields[2] as String?,
      exerciseId: fields[3] as String?,
      startTime: fields[4] as int?,
      endTime: fields[5] as int?,
      devices: (fields[6] as List?)?.cast<ReportDeviceEntity>(),
      reports: (fields[7] as List?)?.cast<ReportDataEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$ReportEntityImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.sessionId)
      ..writeByte(3)
      ..write(obj.exerciseId)
      ..writeByte(4)
      ..write(obj.startTime)
      ..writeByte(5)
      ..write(obj.endTime)
      ..writeByte(6)
      ..write(obj.devices)
      ..writeByte(7)
      ..write(obj.reports);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReportDeviceEntityAdapter extends TypeAdapter<_$ReportDeviceEntityImpl> {
  @override
  final int typeId = 9;

  @override
  _$ReportDeviceEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ReportDeviceEntityImpl(
      name: fields[0] as String?,
      identifier: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$ReportDeviceEntityImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.identifier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportDeviceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReportDataEntityAdapter extends TypeAdapter<_$ReportDataEntityImpl> {
  @override
  final int typeId = 10;

  @override
  _$ReportDataEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ReportDataEntityImpl(
      type: fields[0] as String?,
      data: (fields[1] as List?)?.cast<DataValueEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$ReportDataEntityImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportDataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataValueEntityAdapter extends TypeAdapter<_$DataValueEntityImpl> {
  @override
  final int typeId = 11;

  @override
  _$DataValueEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$DataValueEntityImpl(
      device: fields[0] as String?,
      value: (fields[1] as List?)
          ?.map((dynamic e) => (e as List).cast<dynamic>())
          ?.toList(),
    );
  }

  @override
  void write(BinaryWriter writer, _$DataValueEntityImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.device)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataValueEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
