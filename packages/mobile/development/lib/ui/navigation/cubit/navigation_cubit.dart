import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/helper/logger.dart';
import 'package:polar/polar.dart';

part 'navigation_cubit.freezed.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final BleStatusUcecase _bleStatusUcecase;
  final ScanBluetoothUsecase _scanBluetoothUsecase;
  final ConnectPolarBleUsecase _connectPolarBleUsecase;
  final ConnectCommonBleUsecase _connectCommonBleUsecase;
  final GetPolarServicesUsecase _getPolarServicesUsecase;
  final GetCommonServicesUsecase _getCommonServicesUsecase;
  final GetHrPolarUsecase _getHrPolarUsecase;
  final GetHrCommonUsecase _getHrCommonUsecase;

  NavigationCubit(
    this._bleStatusUcecase,
    this._scanBluetoothUsecase,
    this._connectPolarBleUsecase,
    this._connectCommonBleUsecase,
    this._getPolarServicesUsecase,
    this._getCommonServicesUsecase,
    this._getHrPolarUsecase,
    this._getHrCommonUsecase,
  ) : super(NavigationState(
          isBleOn: false,
          devices: [],
        ));

  StreamSubscription? bleStream;
  StreamSubscription? _scanStream;
  StreamSubscription? _commonConnection;
  StreamSubscription? _hrPolarStream;
  StreamSubscription? _hrCommonStream;

  Future<void> init() async {
    disposeAll();
    _bleStatusListener();
  }

  disposeAll() {
    bleStream?.cancel();
    _scanStream?.cancel();
    _commonConnection?.cancel();
    _hrPolarStream?.cancel();
    _hrCommonStream?.cancel();
  }

  Future<void> _bleStatusListener() async {
    bleStream = _bleStatusUcecase.call().listen((event) {
      event.fold(
        (l) => null,
        (r) {
          if (r == BleStatus.ready) {
            emit(NavigationState(isBleOn: true, isScanning: true));
            scanDevices();
          } else {
            emit(NavigationState(isBleOn: false, isScanning: false));
            _scanStream?.cancel();
            _scanStream = null;
          }
        },
      );
    });
  }

  Future<void> scanDevices() async {
    List<BluetoothEntity> devices = [];
    _scanStream ??= _scanBluetoothUsecase.call().listen(
      (event) {
        event.fold(
          (l) {
            log?.e("[SCAN ERROR] $l");
            emit(state.copyWith(isScanning: false, state: null, devices: []));
          },
          (device) async {
            final bool isDeviceAlreadyAdded =
                devices.any((e) => e.commonId == device.commonId);
            if (!isDeviceAlreadyAdded) {
              if (device.common!.name.contains("Polar")) {
                devices.add(device.copyWith(
                  polarId: getPolarId(device.common!.name),
                ));
              } else {
                devices.add(device);
              }
              emit(state.copyWith(
                  devices: devices, isScanning: true, state: null));
              log?.i('Device added: $device');
            } else {
              final index =
                  devices.indexWhere((e) => e.commonId == device.commonId);
              if (device.common!.name.contains("Polar")) {
                devices[index] = device.copyWith(
                  polarId: getPolarId(device.common!.name),
                );
              } else {
                devices[index] = device;
              }
              emit(state.copyWith(
                  devices: devices, isScanning: true, state: null));
            }
          },
        );
      },
    );
  }

  Future<void> connectToDevice(BluetoothEntity entity) async {
    if (entity.common!.name.contains("Polar")) {
      await connectToPolarDevice(entity.copyWith(
        polarId: getPolarId(entity.common!.name),
      ));
    } else {
      connectToCommonDevice(entity);
    }
  }

  Future<void> connectToPolarDevice(BluetoothEntity entity) async {
    if (_scanStream != null) {
      _scanStream?.cancel();
      _scanStream = null;
    }
    if (_commonConnection != null) {
      _commonConnection?.cancel();
      _commonConnection = null;
    }
    final con = await _connectPolarBleUsecase.call(BluetoothParams(
      polarId: entity.polarId ?? getPolarId(entity.common!.name),
    ));
    con.fold((l) => log?.e("[POLAR CONNECTION ERROR] $l"), (_) async {
      await discoverTypesPolar(entity);
    });
  }

  Future<void> discoverTypesPolar(BluetoothEntity entity) async {
    final res = await _getPolarServicesUsecase.call(BluetoothParams(
      polarId: entity.polarId ?? getPolarId(entity.common!.name),
    ));
    res.fold(
      (l) => log?.e("[POLAR DISCOVER ERROR] $l"),
      (r) {
        log?.i("Polar services discovered: $r");

        emit(
          state.copyWith(
            isScanning: false,
            polarTypes: r,
          ),
        );
        subscribeHrPolar(entity, r);
      },
    );
  }

  Future<void> subscribeHrPolar(
      BluetoothEntity entity, Set<PolarDataType> r) async {
    _hrPolarStream ??= _getHrPolarUsecase
        .call(BluetoothParams(
      polarId: entity.polarId ?? getPolarId(entity.common!.name),
      types: r,
    ))
        .listen((event) {
      event.fold(
        (l) {
          log?.e("[HR POLAR ERROR] $l");
          emit(state.copyWith(hr: null));
          if (_hrPolarStream != null) {
            _hrPolarStream?.cancel();
            _hrPolarStream = null;
          }
        },
        (r) {
          emit(state.copyWith(hr: r.samples.last.hr));
        },
      );
    });
  }

  Future<void> connectToCommonDevice(BluetoothEntity entity) async {
    if (_scanStream != null) {
      _scanStream?.cancel();
      _scanStream = null;
    }
    if (_commonConnection != null) {
      _commonConnection?.cancel();
      _commonConnection = null;
    }
    _commonConnection = _connectCommonBleUsecase
        .call(BluetoothParams(
      deviceId: entity.commonId,
    ))
        .listen((event) {
      event.fold(
        (l) => log?.e("[COMMON CONNECTION ERROR] $l"),
        (r) {
          log?.i("Connected to common device: $r");

          emit(
            state.copyWith(
              isScanning: false,
              state: r,
            ),
          );
          discoverTypesCommon(entity);
        },
      );
    });
  }

  Future<void> discoverTypesCommon(BluetoothEntity entity) async {
    final res = await _getCommonServicesUsecase.call(BluetoothParams(
      deviceId: entity.commonId,
    ));
    res.fold(
      (l) => log?.e("[COMMON DISCOVER ERROR] $l"),
      (r) {
        log?.i("Common services discovered: $r");

        emit(
          state.copyWith(
            isScanning: false,
            commonServices: r,
          ),
        );
        subscribeHrCommon(entity, r);
      },
    );
  }

  Future<void> subscribeHrCommon(
    BluetoothEntity entity,
    List<Service> services,
  ) async {
    _hrCommonStream ??= _getHrCommonUsecase
        .call(BluetoothParams(
      deviceId: entity.commonId,
      service: services.firstWhere(
        (e) => e.id == Uuid.parse("0000180d-0000-1000-8000-00805f9b34fb"),
      ),
    ))
        .listen((event) {
      event.fold(
        (l) {
          log?.e("[HR COMMON ERROR] $l");
          emit(state.copyWith(hr: null));
          if (_hrCommonStream != null) {
            _hrCommonStream?.cancel();
            _hrCommonStream = null;
          }
        },
        (r) {
          emit(state.copyWith(hr: r[1]));
        },
      );
    });
  }

  String getPolarId(String commonName) {
    return commonName.split(' ').last;
  }
}
