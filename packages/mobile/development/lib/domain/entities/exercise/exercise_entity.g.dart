// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseEntityAdapter extends TypeAdapter<_$ExerciseEntityImpl> {
  @override
  final int typeId = 2;

  @override
  _$ExerciseEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ExerciseEntityImpl(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      difficulty: fields[3] as String?,
      type: fields[4] as String?,
      thumbnail: fields[5] as String?,
      duration: fields[6] as int?,
      instructions: (fields[7] as List?)?.cast<ExerciseInstructionEntity>(),
      createdAt: fields[8] as DateTime?,
      updatedAt: fields[9] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$ExerciseEntityImpl obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.difficulty)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.thumbnail)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.instructions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExerciseInstructionEntityAdapter
    extends TypeAdapter<_$ExerciseInstructionEntityImpl> {
  @override
  final int typeId = 3;

  @override
  _$ExerciseInstructionEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ExerciseInstructionEntityImpl(
      id: fields[0] as String?,
      type: fields[1] as String?,
      duration: fields[2] as int?,
      name: fields[3] as String?,
      description: fields[4] as String?,
      content: fields[5] as ExerciseContentEntity?,
    );
  }

  @override
  void write(BinaryWriter writer, _$ExerciseInstructionEntityImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseInstructionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExerciseContentEntityAdapter
    extends TypeAdapter<_$ExerciseContentEntityImpl> {
  @override
  final int typeId = 4;

  @override
  _$ExerciseContentEntityImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ExerciseContentEntityImpl(
      video: fields[0] as String?,
      image: fields[1] as String?,
      text: fields[2] as String?,
      lottie: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$ExerciseContentEntityImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.video)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.lottie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseContentEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
