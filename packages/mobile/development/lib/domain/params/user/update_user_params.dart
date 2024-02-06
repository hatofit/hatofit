import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';

part 'update_user_params.freezed.dart';

@freezed
class UpdateUserParams with _$UpdateUserParams {
  const factory UpdateUserParams({
    @Default(null) UserEntity? user,
    @Default(true) bool forLocal,
  }) = _UpdateUserParams;
}
