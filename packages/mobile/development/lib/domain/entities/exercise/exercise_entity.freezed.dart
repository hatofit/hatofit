// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExerciseEntity {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get difficulty => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get type => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get thumbnail => throw _privateConstructorUsedError;
  @HiveField(6)
  int? get duration => throw _privateConstructorUsedError;
  @HiveField(7)
  List<ExerciseInstructionEntity>? get instructions =>
      throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(9)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseEntityCopyWith<ExerciseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseEntityCopyWith<$Res> {
  factory $ExerciseEntityCopyWith(
          ExerciseEntity value, $Res Function(ExerciseEntity) then) =
      _$ExerciseEntityCopyWithImpl<$Res, ExerciseEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? name,
      @HiveField(2) String? description,
      @HiveField(3) String? difficulty,
      @HiveField(4) String? type,
      @HiveField(5) String? thumbnail,
      @HiveField(6) int? duration,
      @HiveField(7) List<ExerciseInstructionEntity>? instructions,
      @HiveField(8) DateTime? createdAt,
      @HiveField(9) DateTime? updatedAt});
}

/// @nodoc
class _$ExerciseEntityCopyWithImpl<$Res, $Val extends ExerciseEntity>
    implements $ExerciseEntityCopyWith<$Res> {
  _$ExerciseEntityCopyWithImpl(this._value, this._then);

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
              as List<ExerciseInstructionEntity>?,
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
abstract class _$$ExerciseEntityImplCopyWith<$Res>
    implements $ExerciseEntityCopyWith<$Res> {
  factory _$$ExerciseEntityImplCopyWith(_$ExerciseEntityImpl value,
          $Res Function(_$ExerciseEntityImpl) then) =
      __$$ExerciseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? name,
      @HiveField(2) String? description,
      @HiveField(3) String? difficulty,
      @HiveField(4) String? type,
      @HiveField(5) String? thumbnail,
      @HiveField(6) int? duration,
      @HiveField(7) List<ExerciseInstructionEntity>? instructions,
      @HiveField(8) DateTime? createdAt,
      @HiveField(9) DateTime? updatedAt});
}

/// @nodoc
class __$$ExerciseEntityImplCopyWithImpl<$Res>
    extends _$ExerciseEntityCopyWithImpl<$Res, _$ExerciseEntityImpl>
    implements _$$ExerciseEntityImplCopyWith<$Res> {
  __$$ExerciseEntityImplCopyWithImpl(
      _$ExerciseEntityImpl _value, $Res Function(_$ExerciseEntityImpl) _then)
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
    return _then(_$ExerciseEntityImpl(
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
              as List<ExerciseInstructionEntity>?,
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

@HiveType(
    typeId: BoxTypeId.exerciseEntityIndex,
    adapterName: BoxTypeId.exerciseEntityAdapterName)
class _$ExerciseEntityImpl implements _ExerciseEntity {
  const _$ExerciseEntityImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.name,
      @HiveField(2) this.description,
      @HiveField(3) this.difficulty,
      @HiveField(4) this.type,
      @HiveField(5) this.thumbnail,
      @HiveField(6) this.duration,
      @HiveField(7) final List<ExerciseInstructionEntity>? instructions,
      @HiveField(8) this.createdAt,
      @HiveField(9) this.updatedAt})
      : _instructions = instructions;

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final String? description;
  @override
  @HiveField(3)
  final String? difficulty;
  @override
  @HiveField(4)
  final String? type;
  @override
  @HiveField(5)
  final String? thumbnail;
  @override
  @HiveField(6)
  final int? duration;
  final List<ExerciseInstructionEntity>? _instructions;
  @override
  @HiveField(7)
  List<ExerciseInstructionEntity>? get instructions {
    final value = _instructions;
    if (value == null) return null;
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(8)
  final DateTime? createdAt;
  @override
  @HiveField(9)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ExerciseEntity(id: $id, name: $name, description: $description, difficulty: $difficulty, type: $type, thumbnail: $thumbnail, duration: $duration, instructions: $instructions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseEntityImpl &&
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
  _$$ExerciseEntityImplCopyWith<_$ExerciseEntityImpl> get copyWith =>
      __$$ExerciseEntityImplCopyWithImpl<_$ExerciseEntityImpl>(
          this, _$identity);
}

abstract class _ExerciseEntity implements ExerciseEntity {
  const factory _ExerciseEntity(
      {@HiveField(0) final String? id,
      @HiveField(1) final String? name,
      @HiveField(2) final String? description,
      @HiveField(3) final String? difficulty,
      @HiveField(4) final String? type,
      @HiveField(5) final String? thumbnail,
      @HiveField(6) final int? duration,
      @HiveField(7) final List<ExerciseInstructionEntity>? instructions,
      @HiveField(8) final DateTime? createdAt,
      @HiveField(9) final DateTime? updatedAt}) = _$ExerciseEntityImpl;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  String? get name;
  @override
  @HiveField(2)
  String? get description;
  @override
  @HiveField(3)
  String? get difficulty;
  @override
  @HiveField(4)
  String? get type;
  @override
  @HiveField(5)
  String? get thumbnail;
  @override
  @HiveField(6)
  int? get duration;
  @override
  @HiveField(7)
  List<ExerciseInstructionEntity>? get instructions;
  @override
  @HiveField(8)
  DateTime? get createdAt;
  @override
  @HiveField(9)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseEntityImplCopyWith<_$ExerciseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExerciseInstructionEntity {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get type => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get duration => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(5)
  ExerciseContentEntity? get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseInstructionEntityCopyWith<ExerciseInstructionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseInstructionEntityCopyWith<$Res> {
  factory $ExerciseInstructionEntityCopyWith(ExerciseInstructionEntity value,
          $Res Function(ExerciseInstructionEntity) then) =
      _$ExerciseInstructionEntityCopyWithImpl<$Res, ExerciseInstructionEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? type,
      @HiveField(2) int? duration,
      @HiveField(3) String? name,
      @HiveField(4) String? description,
      @HiveField(5) ExerciseContentEntity? content});

  $ExerciseContentEntityCopyWith<$Res>? get content;
}

/// @nodoc
class _$ExerciseInstructionEntityCopyWithImpl<$Res,
        $Val extends ExerciseInstructionEntity>
    implements $ExerciseInstructionEntityCopyWith<$Res> {
  _$ExerciseInstructionEntityCopyWithImpl(this._value, this._then);

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
              as ExerciseContentEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseContentEntityCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $ExerciseContentEntityCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExerciseInstructionEntityImplCopyWith<$Res>
    implements $ExerciseInstructionEntityCopyWith<$Res> {
  factory _$$ExerciseInstructionEntityImplCopyWith(
          _$ExerciseInstructionEntityImpl value,
          $Res Function(_$ExerciseInstructionEntityImpl) then) =
      __$$ExerciseInstructionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? type,
      @HiveField(2) int? duration,
      @HiveField(3) String? name,
      @HiveField(4) String? description,
      @HiveField(5) ExerciseContentEntity? content});

  @override
  $ExerciseContentEntityCopyWith<$Res>? get content;
}

/// @nodoc
class __$$ExerciseInstructionEntityImplCopyWithImpl<$Res>
    extends _$ExerciseInstructionEntityCopyWithImpl<$Res,
        _$ExerciseInstructionEntityImpl>
    implements _$$ExerciseInstructionEntityImplCopyWith<$Res> {
  __$$ExerciseInstructionEntityImplCopyWithImpl(
      _$ExerciseInstructionEntityImpl _value,
      $Res Function(_$ExerciseInstructionEntityImpl) _then)
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
    return _then(_$ExerciseInstructionEntityImpl(
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
              as ExerciseContentEntity?,
    ));
  }
}

/// @nodoc

@HiveType(
    typeId: BoxTypeId.exerciseInstructionEntityIndex,
    adapterName: BoxTypeId.exerciseInstructionEntityAdapterName)
class _$ExerciseInstructionEntityImpl implements _ExerciseInstructionEntity {
  const _$ExerciseInstructionEntityImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.type,
      @HiveField(2) this.duration,
      @HiveField(3) this.name,
      @HiveField(4) this.description,
      @HiveField(5) this.content});

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String? type;
  @override
  @HiveField(2)
  final int? duration;
  @override
  @HiveField(3)
  final String? name;
  @override
  @HiveField(4)
  final String? description;
  @override
  @HiveField(5)
  final ExerciseContentEntity? content;

  @override
  String toString() {
    return 'ExerciseInstructionEntity(id: $id, type: $type, duration: $duration, name: $name, description: $description, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseInstructionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, duration, name, description, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseInstructionEntityImplCopyWith<_$ExerciseInstructionEntityImpl>
      get copyWith => __$$ExerciseInstructionEntityImplCopyWithImpl<
          _$ExerciseInstructionEntityImpl>(this, _$identity);
}

abstract class _ExerciseInstructionEntity implements ExerciseInstructionEntity {
  const factory _ExerciseInstructionEntity(
          {@HiveField(0) final String? id,
          @HiveField(1) final String? type,
          @HiveField(2) final int? duration,
          @HiveField(3) final String? name,
          @HiveField(4) final String? description,
          @HiveField(5) final ExerciseContentEntity? content}) =
      _$ExerciseInstructionEntityImpl;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  String? get type;
  @override
  @HiveField(2)
  int? get duration;
  @override
  @HiveField(3)
  String? get name;
  @override
  @HiveField(4)
  String? get description;
  @override
  @HiveField(5)
  ExerciseContentEntity? get content;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseInstructionEntityImplCopyWith<_$ExerciseInstructionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExerciseContentEntity {
  @HiveField(0)
  String? get video => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get image => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get text => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get lottie => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseContentEntityCopyWith<ExerciseContentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseContentEntityCopyWith<$Res> {
  factory $ExerciseContentEntityCopyWith(ExerciseContentEntity value,
          $Res Function(ExerciseContentEntity) then) =
      _$ExerciseContentEntityCopyWithImpl<$Res, ExerciseContentEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String? video,
      @HiveField(1) String? image,
      @HiveField(2) String? text,
      @HiveField(3) String? lottie});
}

/// @nodoc
class _$ExerciseContentEntityCopyWithImpl<$Res,
        $Val extends ExerciseContentEntity>
    implements $ExerciseContentEntityCopyWith<$Res> {
  _$ExerciseContentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
    Object? image = freezed,
    Object? text = freezed,
    Object? lottie = freezed,
  }) {
    return _then(_value.copyWith(
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ExerciseContentEntityImplCopyWith<$Res>
    implements $ExerciseContentEntityCopyWith<$Res> {
  factory _$$ExerciseContentEntityImplCopyWith(
          _$ExerciseContentEntityImpl value,
          $Res Function(_$ExerciseContentEntityImpl) then) =
      __$$ExerciseContentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? video,
      @HiveField(1) String? image,
      @HiveField(2) String? text,
      @HiveField(3) String? lottie});
}

/// @nodoc
class __$$ExerciseContentEntityImplCopyWithImpl<$Res>
    extends _$ExerciseContentEntityCopyWithImpl<$Res,
        _$ExerciseContentEntityImpl>
    implements _$$ExerciseContentEntityImplCopyWith<$Res> {
  __$$ExerciseContentEntityImplCopyWithImpl(_$ExerciseContentEntityImpl _value,
      $Res Function(_$ExerciseContentEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
    Object? image = freezed,
    Object? text = freezed,
    Object? lottie = freezed,
  }) {
    return _then(_$ExerciseContentEntityImpl(
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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

@HiveType(
    typeId: BoxTypeId.exerciseContentEntityIndex,
    adapterName: BoxTypeId.exerciseContentEntityAdapterName)
class _$ExerciseContentEntityImpl implements _ExerciseContentEntity {
  const _$ExerciseContentEntityImpl(
      {@HiveField(0) this.video,
      @HiveField(1) this.image,
      @HiveField(2) this.text,
      @HiveField(3) this.lottie});

  @override
  @HiveField(0)
  final String? video;
  @override
  @HiveField(1)
  final String? image;
  @override
  @HiveField(2)
  final String? text;
  @override
  @HiveField(3)
  final String? lottie;

  @override
  String toString() {
    return 'ExerciseContentEntity(video: $video, image: $image, text: $text, lottie: $lottie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseContentEntityImpl &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.lottie, lottie) || other.lottie == lottie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, video, image, text, lottie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseContentEntityImplCopyWith<_$ExerciseContentEntityImpl>
      get copyWith => __$$ExerciseContentEntityImplCopyWithImpl<
          _$ExerciseContentEntityImpl>(this, _$identity);
}

abstract class _ExerciseContentEntity implements ExerciseContentEntity {
  const factory _ExerciseContentEntity(
      {@HiveField(0) final String? video,
      @HiveField(1) final String? image,
      @HiveField(2) final String? text,
      @HiveField(3) final String? lottie}) = _$ExerciseContentEntityImpl;

  @override
  @HiveField(0)
  String? get video;
  @override
  @HiveField(1)
  String? get image;
  @override
  @HiveField(2)
  String? get text;
  @override
  @HiveField(3)
  String? get lottie;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseContentEntityImplCopyWith<_$ExerciseContentEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
