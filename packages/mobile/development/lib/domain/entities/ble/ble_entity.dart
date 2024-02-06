import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polar/polar.dart';

part 'ble_entity.freezed.dart';

@freezed
class BleEntity with _$BleEntity {
  const factory BleEntity({
    required String name,
    required String address,
    required int rssi,
    required bool isConnectable,
    required DateTime timeStamp,
    required BluetoothDevice device,
    List<BluetoothService>? commonservices,
    String? polarId,
    Set<PolarDataType>? polarServices,
  }) = _BleEntity;
}
