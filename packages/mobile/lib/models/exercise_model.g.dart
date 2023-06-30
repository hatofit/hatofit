// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) =>
    ExerciseModel(
      json['_id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['difficulty'] as String,
      json['type'] as String,
      (json['instructions'] as List<dynamic>)
          .map((e) => Instruction.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['thumbnail'] as String,
    );

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'type': instance.type,
      'thumbnail': instance.thumbnail,
      'instructions': instance.instructions.map((e) => e.toJson()).toList(),
    };

Instruction _$InstructionFromJson(Map<String, dynamic> json) => Instruction(
      json['_id'] as String,
      json['type'] as String,
      json['name'] as String?,
      json['duration'] as int,
      json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InstructionToJson(Instruction instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'duration': instance.duration,
      'content': instance.content,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      json['video'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'video': instance.video,
      'image': instance.image,
    };
