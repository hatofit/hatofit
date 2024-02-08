import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_params.freezed.dart';

@freezed
class GetUserParams with _$GetUserParams {
  const factory GetUserParams({
    @Default(false) bool fromLocal,
  }) = _GetUserParams;
}
