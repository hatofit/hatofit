import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/helper/logger.dart';

part 'navigation_cubit.freezed.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final BleStatusUcecase _bleStatusUcecase;
  final ScanBluetoothUsecase _scanBluetoothUsecase;
  NavigationCubit(
    this._bleStatusUcecase,
    this._scanBluetoothUsecase,
  ) : super(NavigationState(
          isBleOn: false,
          devices: [],
        ));

  StreamSubscription? bleStream;
  StreamSubscription? scanStream;

  Future<void> init() async {
    _bleStatusListener();
  }

  void _bleStatusListener() {
    bleStream = _bleStatusUcecase.call().listen((event) {
      event.fold(
        (l) => null,
        (r) {
          if (r == BleStatus.ready) {
            emit(state.copyWith(isBleOn: true));
            _scanDevices();
          } else {
            emit(state.copyWith(isBleOn: false));
            scanStream?.cancel();
            scanStream = null;
          }
        },
      );
    });
  }

  void _scanDevices() {
    List<DiscoveredDevice> devices = [];
    scanStream = _scanBluetoothUsecase.call().listen((event) {
      event.fold(
        (l) => null,
        (r) {
          log?.e(r.toString());

          final bool isDeviceAlreadyAdded =
              devices.any((element) => element.id == r.id);
          if (!isDeviceAlreadyAdded) {
            devices.add(r);
            emit(state.copyWith(devices: devices));
          }

          // if (!devices.contains(r)) {
          //   devices.add(r);
          //   emit(state.copyWith(devices: devices));
          // }
        },
      );
    });
  }
}
