import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_entity.freezed.dart';

@freezed
class BaseResponseEntity<T> with _$BaseResponseEntity<T> {
  const factory BaseResponseEntity({
    dynamic data,
    String? message,
    bool? success,
  }) = _BaseResponseEntity<T>;
}
