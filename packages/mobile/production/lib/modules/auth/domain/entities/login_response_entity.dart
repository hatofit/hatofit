import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/modules/user/domain/entities/user_entity.dart';

part 'login_response_entity.freezed.dart';

@freezed
class LoginResponseEntity with _$LoginResponseEntity {
  const factory LoginResponseEntity({
    bool? success,
    String? token,
    UserEntity? user,
    String? message,
  }) = _LoginResponseEntity;
}
