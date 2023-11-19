import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/modules/auth/domain/entities/login_response_entity.dart';
import 'package:hatofit/modules/user/data/models/user_model.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    bool? success,
    String? message,
    UserModel? user,
    String? token,
  }) = _LoginResponseModel;

  const LoginResponseModel._();

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  LoginResponseEntity toEntity() => LoginResponseEntity(
        success: success,
        token: token,
        user: user?.toEntity(),
        message: message,
      );
}
