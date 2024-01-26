import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';

part 'base_response_model.freezed.dart';
part 'base_response_model.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseResponseModel<T> with _$BaseResponseModel {
  const factory BaseResponseModel({
    T? data,
    String? message,
    bool? success,
  }) = _BaseResponseModel<T>;

  const BaseResponseModel._();

  factory BaseResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseModelFromJson(json, fromJsonT);

  BaseResponseEntity<T> toEntity() => BaseResponseEntity<T>(
        data: data,
        message: message,
        success: success,
      );
}
