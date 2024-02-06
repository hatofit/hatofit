import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  @HiveType(
    typeId: BoxTypeId.userEntityIndex,
    adapterName: BoxTypeId.userEntityAdapterName,
  )
  const factory UserEntity({
    @HiveField(0) String? id,
    @HiveField(1) String? firstName,
    @HiveField(2) String? lastName,
    @HiveField(3) String? gender,
    @HiveField(4) String? email,
    @HiveField(5) DateTime? dateOfBirth,
    @HiveField(6) String? photo,
    @HiveField(7) UserMetricUnitsEntity? metricUnits,
    @HiveField(8) int? height,
    @HiveField(9) int? weight,
    @HiveField(10) DateTime? createdAt,
    @HiveField(11) DateTime? updatedAt,
  }) = _UserEntity;
}

@freezed
class UserMetricUnitsEntity with _$UserMetricUnitsEntity {
  @HiveType(
    typeId: BoxTypeId.metricUnitsEntityIndex,
    adapterName: BoxTypeId.metricUnitsEntityAdapterName,
  )
  const factory UserMetricUnitsEntity({
    @HiveField(0) String? energyUnits,
    @HiveField(1) String? heightUnits,
    @HiveField(2) String? weightUnits,
  }) = _UserMetricUnitsEntity;
}

void regisUser() {
  if (!Hive.isAdapterRegistered(BoxTypeId.userEntityIndex)) {
    Hive.registerAdapter(UserEntityAdapter());
  }
  if (!Hive.isAdapterRegistered(BoxTypeId.metricUnitsEntityIndex)) {
    Hive.registerAdapter(UserMetricUnitsEntityAdapter());
  }
}
