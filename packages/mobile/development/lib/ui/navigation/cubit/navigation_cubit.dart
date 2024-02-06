import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/helper/logger.dart';
import 'package:polar/polar.dart';

part 'navigation_cubit.freezed.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final ScanCommonBLEUsecase _scanCommonBLEUsecase;
  final ScanResultsBLEUsecase _scanResultsBLEUsecase;
  final AdapterStateBLEUsecase _adapterStateBLEUsecase;
  final IsScanningBLEUsecase _isScanningBLEUsecase;
  final ConnectPolarBLEUsecase _connectPolarBleUsecase;
  final DisconnectPolarBLEUsecase _disconnectPolarBleDeviceUsecase;
  final ConnectCommonBLEUsecase _connectCommonBleUsecase;
  final DisconnectCommonBleUsecase _disconnectCommonBleUsecase;
  final GetServicesPolarBLEUsecase _getPolarServicesUsecase;
  final GetServicesCommonBLEUsecase _getCommonServicesUsecase;
  final StreamHrPolarBLEUsecase _streamHrPolarBLEUsecase;
  final StreamCommonBLEUsecase _streamCommonBLEUsecase;
  final StopScanBLEUsecase _stopScanBLEUsecase;

  NavigationCubit(
    this._scanCommonBLEUsecase,
    this._scanResultsBLEUsecase,
    this._adapterStateBLEUsecase,
    this._isScanningBLEUsecase,
    this._connectPolarBleUsecase,
    this._disconnectPolarBleDeviceUsecase,
    this._connectCommonBleUsecase,
    this._disconnectCommonBleUsecase,
    this._getPolarServicesUsecase,
    this._getCommonServicesUsecase,
    this._streamHrPolarBLEUsecase,
    this._streamCommonBLEUsecase,
    this._stopScanBLEUsecase,
  ) : super(NavigationState(bleFailure: null));

  StreamSubscription? _bleAdapterStateStream;
  StreamSubscription? _scanResultStream;
  StreamSubscription? _isScanningStream;
  StreamSubscription? _scanStream;
  StreamSubscription? _hrPolarStream;
  StreamSubscription? _hrCommonStream;
  StreamSubscription? _conStateCommonStream;
  void init() {
    _bleAdapterListener();
  }

  void _bleAdapterListener() {
    _bleAdapterStateStream ??= _adapterStateBLEUsecase.call().listen((event) {
      event.fold(
        (l) {
          emit(state.copyWith(state: BluetoothAdapterState.unknown));
        },
        (r) {
          emit(state.copyWith(state: r));
        },
      );
    });
    _scanResultStream ??= _scanResultsBLEUsecase.call().listen(
      (event) {
        event.fold(
          (l) {
            if (l is BluetoothFailure) {
              log.i("Scan results [F] ${l.message}");
            }
          },
          (device) {
            log.i("Scan results [S] $device");
            emit(state.copyWith(fDevices: device));
          },
        );
      },
    );
    _isScanningStream ??= _isScanningBLEUsecase.call().listen((event) {
      event.fold((l) {
        emit(state.copyWith(isScanning: false));
      }, (r) {
        emit(state.copyWith(isScanning: r));
      });
    });
  }

  Future<void> startScan() async {
    await _scanCommonBLEUsecase.call(
      StartScanCommonParams(
        serviceIds: [GuidConstant.get.hrS],
      ),
    );
  }

  Future<void> connectToDevice(BleEntity entity) async {
    if (!entity.isConnectable) {
      return;
    } else if (entity.name.contains("Polar")) {
      await connectToPolarDevice(entity);
    } else {
      await connectToCommonDevice(entity);
    }
  }

  Future<void> connectToPolarDevice(BleEntity entity) async {
    if (_scanStream != null) {
      _scanStream?.cancel();
      _scanStream = null;
    }
    if (entity.polarId != null) {
      final con = await _connectPolarBleUsecase.call(ConnectPolarParams(
        deviceId: entity.polarId ?? "",
      ));
      con.fold((l) => null, (_) async {
        await discoverTypesPolar(entity);
      });
    }
  }

  Future<void> connectToCommonDevice(BleEntity entity) async {
    // if (_scanStream != null) {
    //   await _stopScanBLEUsecase
    //       .call(StopScanCommonParams(subscription: _scanStream!));
    //   await _scanStream?.cancel();
    //   _scanStream = null;
    // }
    emit(state.copyWith(bleFailure: null, isLoading: true));
    if (entity.device.isConnected) {
      await _disconnectCommonBleUsecase.call(DisconnectCommonParams(
        device: entity.device,
      ));
    }
    final con = await _connectCommonBleUsecase.call(ConnectCommonParams(
      device: entity.device,
      timeout: const Duration(seconds: 30),
    ));
    con.fold((l) {
      if (l is BluetoothFailure) {
        log.i("Common connect [F] ${l.message}");
        emit(state.copyWith(cDevice: null, bleFailure: l, isLoading: false));
      }
      ;
    }, (_) async {
      log.i("Common connect [S]");
      emit(state.copyWith(
        cDevice: entity,
      ));
      await discoverTypesCommon(entity);
    });
  }

  Future<void> discoverTypesPolar(BleEntity entity) async {
    final res = await _getPolarServicesUsecase.call(GetPolarServicesParams(
      deviceId: entity.polarId ?? getPolarId(entity.name),
      feature: PolarSdkFeature.onlineStreaming,
    ));
    res.fold(
      (l) => null,
      (r) async {
        emit(state.copyWith(
          fDevices: state.fDevices?.map((e) {
            if (e.polarId == entity.polarId) {
              return e.copyWith(polarServices: r);
            }
            return e;
          }).toList(),
          cDevice: entity,
        ));

        await subscribeHrPolar(entity, r);
      },
    );
  }

  Future<void> discoverTypesCommon(BleEntity entity) async {
    final res = await _getCommonServicesUsecase.call(GetCommonServicesParams(
      device: entity.device,
    ));
    res.fold(
      (l) => log.i("Common discover [F] $l"),
      (r) async {
        _conStateCommonStream ??= entity.device.connectionState.listen((event) {
          log.i("Common connection state $event");
        });
        await subscribeHrCommon(entity, r);
      },
    );
  }

  Future<void> subscribeHrPolar(BleEntity entity, Set<PolarDataType> r) async {
    _hrPolarStream ??= _streamHrPolarBLEUsecase
        .call(StreamPolarParams(
      deviceId: entity.polarId ?? getPolarId(entity.name),
      types: r,
    ))
        .listen((event) {
      event.fold(
        (l) {
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

  Future<void> subscribeHrCommon(
    BleEntity entity,
    List<BluetoothService> services,
  ) async {
    final hrSc = services.firstWhere((e) => e.uuid == GuidConstant.get.hrS);
    final hrmCr = hrSc.characteristics
        .firstWhere((e) => e.characteristicUuid == GuidConstant.get.hrmC);
    _hrCommonStream ??= _streamCommonBLEUsecase
        .call(StreamCommonParams(
      characteristic: hrmCr,
    ))
        .listen((event) {
      event.fold(
        (l) {
          log.i("Common hr [F] $l");
          emit(state.copyWith(hr: null));
          // if (_hrCommonStream != null) {
          //   _hrCommonStream?.cancel();
          //   _hrCommonStream = null;
          // }
        },
        (r) {
          if (r.isNotEmpty) {
            emit(
              state.copyWith(hr: r[1], cDevice: entity, isLoading: false),
            );
          }
        },
      );
    });
    entity.device.cancelWhenDisconnected(_hrCommonStream!);
    if (entity.device.isConnected) {
      await hrmCr.setNotifyValue(hrmCr.isNotifying == false);
    }
  }

  Future<void> disconnectDevice(BleEntity entity) async {
    if (entity.name.contains("Polar")) {
      await _disconnectPolarBleDeviceUsecase.call(DisconnectPolarParams(
        deviceId: entity.polarId ?? getPolarId(entity.name),
      ));
      await _hrPolarStream?.cancel();
      _hrPolarStream = null;
    } else {
      await _disconnectCommonBleUsecase.call(DisconnectCommonParams(
        device: entity.device,
      ));
      if (_hrCommonStream != null) {
        entity.device.cancelWhenDisconnected(_hrCommonStream!);
      }
      _hrCommonStream = null;
    }
    emit(state.copyWith(
      state: null,
      hr: null,
      cDevice: null,
    ));
  }

  String getPolarId(String commonName) {
    return commonName.split(' ').last;
  }
}
