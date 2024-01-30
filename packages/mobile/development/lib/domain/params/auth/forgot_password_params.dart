import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_params.freezed.dart';
part 'forgot_password_params.g.dart';

@freezed
class ForgotPasswordParams with _$ForgotPasswordParams {
  const factory ForgotPasswordParams({
    @Default("") String email,
  }) = _ForgotPasswordParams;

  factory ForgotPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordParamsFromJson(json);
}
