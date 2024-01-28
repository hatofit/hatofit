import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

part 'bluetooth_model.freezed.dart';

@freezed
class BluetoothModel with _$BluetoothModel {
  const factory BluetoothModel({
    PolarDeviceInfo? polar,
    DiscoveredDevice? common,
  }) = _BluetoothModel;

  const BluetoothModel._();

  BluetoothEntity toEntity() => BluetoothEntity(
        polar: polar,
        common: common,
      );
}
