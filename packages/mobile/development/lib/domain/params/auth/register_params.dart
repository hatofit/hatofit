import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_params.freezed.dart';

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    @Default("") String firstName,
    @Default("") String lastName,
    @Default("") String gender,
    @Default("") String email,
    @Default("") String password,
    @Default("") String confirmPassword,
    @Default("") String dateOfBirth,
    @Default(null) File? photo,
    @Default(0) int height,
    @Default(0) int weight,
    @Default(null) Map<String, String>? metricUnits,
  }) = _RegisterParams;

  const RegisterParams._();

  FormData toFromData() => FormData.fromMap({
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "dateOfBirth": dateOfBirth,
        "photo": photo != null ? MultipartFile.fromFileSync(photo!.path) : null,
        "height": height,
        "weight": weight,
        "metricUnits": metricUnits,
      });
}
