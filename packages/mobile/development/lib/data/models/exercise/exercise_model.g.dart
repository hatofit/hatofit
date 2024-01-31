// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseModelImpl _$$ExerciseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseModelImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      difficulty: json['difficulty'] as String?,
      type: json['type'] as String?,
      thumbnail: json['thumbnail'] as String?,
      duration: json['duration'] as int?,
      instructions: (json['instructions'] as List<dynamic>?)
          ?.map((e) => InstructionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ExerciseModelImplToJson(_$ExerciseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'type': instance.type,
      'thumbnail': instance.thumbnail,
      'duration': instance.duration,
      'instructions': instance.instructions?.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$InstructionModelImpl _$$InstructionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InstructionModelImpl(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      duration: json['duration'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      content: json['content'] == null
          ? null
          : ExerciseContentModel.fromJson(
              json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InstructionModelImplToJson(
        _$InstructionModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'duration': instance.duration,
      'name': instance.name,
      'description': instance.description,
      'content': instance.content?.toJson(),
    };

_$ExerciseContentModelImpl _$$ExerciseContentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseContentModelImpl(
      video: json['video'] as String?,
      text: json['text'] as String?,
      lottie: json['lottie'] as String?,
    );

Map<String, dynamic> _$$ExerciseContentModelImplToJson(
        _$ExerciseContentModelImpl instance) =>
    <String, dynamic>{
      'video': instance.video,
      'text': instance.text,
      'lottie': instance.lottie,
    };
