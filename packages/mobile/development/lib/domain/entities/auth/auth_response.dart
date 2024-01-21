import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  @HiveType(typeId: 2, adapterName: 'AuthResponseEntityAdapter')
  const factory AuthResponse({
    @HiveField(0) UserEntity? user,
    @HiveField(1) String? token,
  }) = _AuthResponse;
}
