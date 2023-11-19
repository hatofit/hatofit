import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/modules/user/domain/entities/user_entity.dart';

part 'register_response_entity.freezed.dart';

@freezed
class RegisterResponseEntity with _$RegisterResponseEntity {
  const factory RegisterResponseEntity({
    bool? success,
    String? token,
    UserEntity? user,
    String? message,
  }) = _RegisterResponseEntity;
}
