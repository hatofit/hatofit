// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  List<HrBarChartItem> get hrData => throw _privateConstructorUsedError;
  double get calories => throw _privateConstructorUsedError;
  double get bmi => throw _privateConstructorUsedError;
  UserEntity? get user => throw _privateConstructorUsedError;
  String? get heroUrl => throw _privateConstructorUsedError;
  String? get dateNow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<HrBarChartItem> hrData,
      double calories,
      double bmi,
      UserEntity? user,
      String? heroUrl,
      String? dateNow});

  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hrData = null,
    Object? calories = null,
    Object? bmi = null,
    Object? user = freezed,
    Object? heroUrl = freezed,
    Object? dateNow = freezed,
  }) {
    return _then(_value.copyWith(
      hrData: null == hrData
          ? _value.hrData
          : hrData // ignore: cast_nullable_to_non_nullable
              as List<HrBarChartItem>,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      bmi: null == bmi
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as double,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      heroUrl: freezed == heroUrl
          ? _value.heroUrl
          : heroUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateNow: freezed == dateNow
          ? _value.dateNow
          : dateNow // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HrBarChartItem> hrData,
      double calories,
      double bmi,
      UserEntity? user,
      String? heroUrl,
      String? dateNow});

  @override
  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hrData = null,
    Object? calories = null,
    Object? bmi = null,
    Object? user = freezed,
    Object? heroUrl = freezed,
    Object? dateNow = freezed,
  }) {
    return _then(_$HomeStateImpl(
      hrData: null == hrData
          ? _value._hrData
          : hrData // ignore: cast_nullable_to_non_nullable
              as List<HrBarChartItem>,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      bmi: null == bmi
          ? _value.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as double,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      heroUrl: freezed == heroUrl
          ? _value.heroUrl
          : heroUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateNow: freezed == dateNow
          ? _value.dateNow
          : dateNow // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  _$HomeStateImpl(
      {final List<HrBarChartItem> hrData = const [],
      this.calories = 0,
      this.bmi = 0,
      this.user,
      this.heroUrl,
      this.dateNow})
      : _hrData = hrData;

  final List<HrBarChartItem> _hrData;
  @override
  @JsonKey()
  List<HrBarChartItem> get hrData {
    if (_hrData is EqualUnmodifiableListView) return _hrData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hrData);
  }

  @override
  @JsonKey()
  final double calories;
  @override
  @JsonKey()
  final double bmi;
  @override
  final UserEntity? user;
  @override
  final String? heroUrl;
  @override
  final String? dateNow;

  @override
  String toString() {
    return 'HomeState(hrData: $hrData, calories: $calories, bmi: $bmi, user: $user, heroUrl: $heroUrl, dateNow: $dateNow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality().equals(other._hrData, _hrData) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.bmi, bmi) || other.bmi == bmi) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.heroUrl, heroUrl) || other.heroUrl == heroUrl) &&
            (identical(other.dateNow, dateNow) || other.dateNow == dateNow));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_hrData),
      calories,
      bmi,
      user,
      heroUrl,
      dateNow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final List<HrBarChartItem> hrData,
      final double calories,
      final double bmi,
      final UserEntity? user,
      final String? heroUrl,
      final String? dateNow}) = _$HomeStateImpl;

  @override
  List<HrBarChartItem> get hrData;
  @override
  double get calories;
  @override
  double get bmi;
  @override
  UserEntity? get user;
  @override
  String? get heroUrl;
  @override
  String? get dateNow;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
