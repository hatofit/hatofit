import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polar/polar.dart';

part 'bluetooth_entity.freezed.dart';

@freezed
class BluetoothEntity with _$BluetoothEntity {
  const factory BluetoothEntity({
    PolarDeviceInfo? polar,
    DiscoveredDevice? common,
  }) = _BluetootheEntity;
}
