// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) {
  return _ExerciseModel.fromJson(json);
}

/// @nodoc
mixin _$ExerciseModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get difficulty => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  List<InstructionModel>? get instructions =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseModelCopyWith<ExerciseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseModelCopyWith<$Res> {
  factory $ExerciseModelCopyWith(
          ExerciseModel value, $Res Function(ExerciseModel) then) =
      _$ExerciseModelCopyWithImpl<$Res, ExerciseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? description,
      String? difficulty,
      String? type,
      String? thumbnail,
      int? duration,
      List<InstructionModel>? instructions,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ExerciseModelCopyWithImpl<$Res, $Val extends ExerciseModel>
    implements $ExerciseModelCopyWith<$Res> {
  _$ExerciseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? difficulty = freezed,
    Object? type = freezed,
    Object? thumbnail = freezed,
    Object? duration = freezed,
    Object? instructions = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<InstructionModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseModelImplCopyWith<$Res>
    implements $ExerciseModelCopyWith<$Res> {
  factory _$$ExerciseModelImplCopyWith(
          _$ExerciseModelImpl value, $Res Function(_$ExerciseModelImpl) then) =
      __$$ExerciseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? description,
      String? difficulty,
      String? type,
      String? thumbnail,
      int? duration,
      List<InstructionModel>? instructions,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ExerciseModelImplCopyWithImpl<$Res>
    extends _$ExerciseModelCopyWithImpl<$Res, _$ExerciseModelImpl>
    implements _$$ExerciseModelImplCopyWith<$Res> {
  __$$ExerciseModelImplCopyWithImpl(
      _$ExerciseModelImpl _value, $Res Function(_$ExerciseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? difficulty = freezed,
    Object? type = freezed,
    Object? thumbnail = freezed,
    Object? duration = freezed,
    Object? instructions = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ExerciseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      instructions: freezed == instructions
          ? _value._instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<InstructionModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseModelImpl extends _ExerciseModel {
  const _$ExerciseModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.name,
      this.description,
      this.difficulty,
      this.type,
      this.thumbnail,
      this.duration,
      final List<InstructionModel>? instructions,
      this.createdAt,
      this.updatedAt})
      : _instructions = instructions,
        super._();

  factory _$ExerciseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? difficulty;
  @override
  final String? type;
  @override
  final String? thumbnail;
  @override
  final int? duration;
  final List<InstructionModel>? _instructions;
  @override
  List<InstructionModel>? get instructions {
    final value = _instructions;
    if (value == null) return null;
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ExerciseModel(id: $id, name: $name, description: $description, difficulty: $difficulty, type: $type, thumbnail: $thumbnail, duration: $duration, instructions: $instructions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality()
                .equals(other._instructions, _instructions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      difficulty,
      type,
      thumbnail,
      duration,
      const DeepCollectionEquality().hash(_instructions),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseModelImplCopyWith<_$ExerciseModelImpl> get copyWith =>
      __$$ExerciseModelImplCopyWithImpl<_$ExerciseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseModelImplToJson(
      this,
    );
  }
}

abstract class _ExerciseModel extends ExerciseModel {
  const factory _ExerciseModel(
      {@JsonKey(name: '_id') final String? id,
      final String? name,
      final String? description,
      final String? difficulty,
      final String? type,
      final String? thumbnail,
      final int? duration,
      final List<InstructionModel>? instructions,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ExerciseModelImpl;
  const _ExerciseModel._() : super._();

  factory _ExerciseModel.fromJson(Map<String, dynamic> json) =
      _$ExerciseModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get difficulty;
  @override
  String? get type;
  @override
  String? get thumbnail;
  @override
  int? get duration;
  @override
  List<InstructionModel>? get instructions;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseModelImplCopyWith<_$ExerciseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InstructionModel _$InstructionModelFromJson(Map<String, dynamic> json) {
  return _InstructionModel.fromJson(json);
}

/// @nodoc
mixin _$InstructionModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  ExerciseContentModel? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstructionModelCopyWith<InstructionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionModelCopyWith<$Res> {
  factory $InstructionModelCopyWith(
          InstructionModel value, $Res Function(InstructionModel) then) =
      _$InstructionModelCopyWithImpl<$Res, InstructionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? type,
      int? duration,
      String? name,
      String? description,
      ExerciseContentModel? content});

  $ExerciseContentModelCopyWith<$Res>? get content;
}

/// @nodoc
class _$InstructionModelCopyWithImpl<$Res, $Val extends InstructionModel>
    implements $InstructionModelCopyWith<$Res> {
  _$InstructionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? duration = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ExerciseContentModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseContentModelCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $ExerciseContentModelCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InstructionModelImplCopyWith<$Res>
    implements $InstructionModelCopyWith<$Res> {
  factory _$$InstructionModelImplCopyWith(_$InstructionModelImpl value,
          $Res Function(_$InstructionModelImpl) then) =
      __$$InstructionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? type,
      int? duration,
      String? name,
      String? description,
      ExerciseContentModel? content});

  @override
  $ExerciseContentModelCopyWith<$Res>? get content;
}

/// @nodoc
class __$$InstructionModelImplCopyWithImpl<$Res>
    extends _$InstructionModelCopyWithImpl<$Res, _$InstructionModelImpl>
    implements _$$InstructionModelImplCopyWith<$Res> {
  __$$InstructionModelImplCopyWithImpl(_$InstructionModelImpl _value,
      $Res Function(_$InstructionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? duration = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? content = freezed,
  }) {
    return _then(_$InstructionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as ExerciseContentModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructionModelImpl extends _InstructionModel {
  const _$InstructionModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.type,
      this.duration,
      this.name,
      this.description,
      this.content})
      : super._();

  factory _$InstructionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructionModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? type;
  @override
  final int? duration;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final ExerciseContentModel? content;

  @override
  String toString() {
    return 'InstructionModel(id: $id, type: $type, duration: $duration, name: $name, description: $description, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, duration, name, description, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructionModelImplCopyWith<_$InstructionModelImpl> get copyWith =>
      __$$InstructionModelImplCopyWithImpl<_$InstructionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructionModelImplToJson(
      this,
    );
  }
}

abstract class _InstructionModel extends InstructionModel {
  const factory _InstructionModel(
      {@JsonKey(name: '_id') final String? id,
      final String? type,
      final int? duration,
      final String? name,
      final String? description,
      final ExerciseContentModel? content}) = _$InstructionModelImpl;
  const _InstructionModel._() : super._();

  factory _InstructionModel.fromJson(Map<String, dynamic> json) =
      _$InstructionModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get type;
  @override
  int? get duration;
  @override
  String? get name;
  @override
  String? get description;
  @override
  ExerciseContentModel? get content;
  @override
  @JsonKey(ignore: true)
  _$$InstructionModelImplCopyWith<_$InstructionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseContentModel _$ExerciseContentModelFromJson(Map<String, dynamic> json) {
  return _ExerciseContentModel.fromJson(json);
}

/// @nodoc
mixin _$ExerciseContentModel {
  String? get video => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get lottie => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseContentModelCopyWith<ExerciseContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseContentModelCopyWith<$Res> {
  factory $ExerciseContentModelCopyWith(ExerciseContentModel value,
          $Res Function(ExerciseContentModel) then) =
      _$ExerciseContentModelCopyWithImpl<$Res, ExerciseContentModel>;
  @useResult
  $Res call({String? video, String? text, String? lottie});
}

/// @nodoc
class _$ExerciseContentModelCopyWithImpl<$Res,
        $Val extends ExerciseContentModel>
    implements $ExerciseContentModelCopyWith<$Res> {
  _$ExerciseContentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
    Object? text = freezed,
    Object? lottie = freezed,
  }) {
    return _then(_value.copyWith(
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      lottie: freezed == lottie
          ? _value.lottie
          : lottie // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseContentModelImplCopyWith<$Res>
    implements $ExerciseContentModelCopyWith<$Res> {
  factory _$$ExerciseContentModelImplCopyWith(_$ExerciseContentModelImpl value,
          $Res Function(_$ExerciseContentModelImpl) then) =
      __$$ExerciseContentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? video, String? text, String? lottie});
}

/// @nodoc
class __$$ExerciseContentModelImplCopyWithImpl<$Res>
    extends _$ExerciseContentModelCopyWithImpl<$Res, _$ExerciseContentModelImpl>
    implements _$$ExerciseContentModelImplCopyWith<$Res> {
  __$$ExerciseContentModelImplCopyWithImpl(_$ExerciseContentModelImpl _value,
      $Res Function(_$ExerciseContentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
    Object? text = freezed,
    Object? lottie = freezed,
  }) {
    return _then(_$ExerciseContentModelImpl(
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      lottie: freezed == lottie
          ? _value.lottie
          : lottie // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseContentModelImpl extends _ExerciseContentModel {
  const _$ExerciseContentModelImpl({this.video, this.text, this.lottie})
      : super._();

  factory _$ExerciseContentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseContentModelImplFromJson(json);

  @override
  final String? video;
  @override
  final String? text;
  @override
  final String? lottie;

  @override
  String toString() {
    return 'ExerciseContentModel(video: $video, text: $text, lottie: $lottie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseContentModelImpl &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.lottie, lottie) || other.lottie == lottie));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, video, text, lottie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseContentModelImplCopyWith<_$ExerciseContentModelImpl>
      get copyWith =>
          __$$ExerciseContentModelImplCopyWithImpl<_$ExerciseContentModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseContentModelImplToJson(
      this,
    );
  }
}

abstract class _ExerciseContentModel extends ExerciseContentModel {
  const factory _ExerciseContentModel(
      {final String? video,
      final String? text,
      final String? lottie}) = _$ExerciseContentModelImpl;
  const _ExerciseContentModel._() : super._();

  factory _ExerciseContentModel.fromJson(Map<String, dynamic> json) =
      _$ExerciseContentModelImpl.fromJson;

  @override
  String? get video;
  @override
  String? get text;
  @override
  String? get lottie;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseContentModelImplCopyWith<_$ExerciseContentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
