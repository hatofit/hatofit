import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/data/models/models.dart';
import 'package:hatofit/domain/domain.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    String? token,
    UserModel? user,
  }) = _AuthResponseModel;

  const AuthResponseModel._();

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  AuthResponseEntity toEntity() => AuthResponseEntity(
        token: token,
        user: user?.toEntity(),
      );
}
