// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoodEntity {
  String get mood => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoodEntityCopyWith<MoodEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodEntityCopyWith<$Res> {
  factory $MoodEntityCopyWith(
          MoodEntity value, $Res Function(MoodEntity) then) =
      _$MoodEntityCopyWithImpl<$Res, MoodEntity>;
  @useResult
  $Res call({String mood, String date});
}

/// @nodoc
class _$MoodEntityCopyWithImpl<$Res, $Val extends MoodEntity>
    implements $MoodEntityCopyWith<$Res> {
  _$MoodEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoodEntityImplCopyWith<$Res>
    implements $MoodEntityCopyWith<$Res> {
  factory _$$MoodEntityImplCopyWith(
          _$MoodEntityImpl value, $Res Function(_$MoodEntityImpl) then) =
      __$$MoodEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mood, String date});
}

/// @nodoc
class __$$MoodEntityImplCopyWithImpl<$Res>
    extends _$MoodEntityCopyWithImpl<$Res, _$MoodEntityImpl>
    implements _$$MoodEntityImplCopyWith<$Res> {
  __$$MoodEntityImplCopyWithImpl(
      _$MoodEntityImpl _value, $Res Function(_$MoodEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = null,
    Object? date = null,
  }) {
    return _then(_$MoodEntityImpl(
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MoodEntityImpl implements _MoodEntity {
  const _$MoodEntityImpl({required this.mood, required this.date});

  @override
  final String mood;
  @override
  final String date;

  @override
  String toString() {
    return 'MoodEntity(mood: $mood, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodEntityImpl &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mood, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodEntityImplCopyWith<_$MoodEntityImpl> get copyWith =>
      __$$MoodEntityImplCopyWithImpl<_$MoodEntityImpl>(this, _$identity);
}

abstract class _MoodEntity implements MoodEntity {
  const factory _MoodEntity(
      {required final String mood,
      required final String date}) = _$MoodEntityImpl;

  @override
  String get mood;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$MoodEntityImplCopyWith<_$MoodEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
