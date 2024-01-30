import 'package:freezed_annotation/freezed_annotation.dart';

part "reset_password_params.freezed.dart";
part 'reset_password_params.g.dart';

@freezed
class ResetPasswordParams with _$ResetPasswordParams {
  const factory ResetPasswordParams({
    @Default("") String email,
    @Default("") String password,
    @Default("") String confirmPassword,
    @Default("") String code,
  }) = _ResetPasswordParams;

  factory ResetPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordParamsFromJson(json);
}
