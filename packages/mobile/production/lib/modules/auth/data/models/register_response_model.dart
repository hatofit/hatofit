import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/modules/auth/domain/entities/register_response_entity.dart';
import 'package:hatofit/modules/user/data/models/user_model.dart';

part 'register_response_model.freezed.dart';
part 'register_response_model.g.dart';

@freezed
class RegisterResponseModel with _$RegisterResponseModel {
  const factory RegisterResponseModel({
    bool? success,
    String? message,
    UserModel? user,
    String? token,
  }) = _RegisterResponseModel;

  const RegisterResponseModel._();

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  RegisterResponseEntity toEntity() => RegisterResponseEntity(
        success: success,
        token: token,
        user: user?.toEntity(),
        message: message,
      );
}
