import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:polar/polar.dart';

part 'navigation_cubit.freezed.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> with VibratorMixin {
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
  final StreamCommonBLEUsecase _streamCommonBLEUsecase;
  // final StopScanBLEUsecase _stopScanBLEUsecase;
  final StatePolarBleUsecase _statePolarBleUsecase;
  final ReadCommonBLEUsecase _readCommonBLEUsecase;

  final StreamHrPolarBLEUsecase _streamHrPolarBLEUsecase;
  final StreamEcgPolarBLEUsecase _streamEcgPolarBLEUsecase;
  final StreamAccPolarBLEUsecase _streamAccPolarBLEUsecase;
  final StreamGyroPolarBLEUsecase _streamGyroPolarBLEUsecase;
  final StreamMagnetometerPolarBLEUsecase _streamMagnetometerPolarBLEUsecase;
  final StreamPpgPolarBLEUsecase _streamPpgPolarBLEUsecase;

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
    // this._stopScanBLEUsecase,
    this._statePolarBleUsecase,
    this._streamEcgPolarBLEUsecase,
    this._streamAccPolarBLEUsecase,
    this._streamGyroPolarBLEUsecase,
    this._streamMagnetometerPolarBLEUsecase,
    this._streamPpgPolarBLEUsecase,
    this._readCommonBLEUsecase,
  ) : super(NavigationState(bleFailure: null));

  StreamSubscription? _bleAdapterStateStream;
  StreamSubscription? _scanResultStream;
  StreamSubscription? _isScanningStream;
  StreamSubscription? _hrPolarStream;
  StreamSubscription? _ecgPolarStream;
  StreamSubscription? _accPolarStream;
  StreamSubscription? _gyroPolarStream;
  StreamSubscription? _magnetometerPolarStream;
  StreamSubscription? _ppgPolarStream;

  StreamSubscription? _hrCommonStream;
  StreamSubscription? _conStateCommonStream;
  StreamSubscription? _polarStateStream;
  void init() {
    _disposer();
    _bleAdapterListener();
  }

  void _disposer() {
    if (_bleAdapterStateStream != null) {
      _bleAdapterStateStream?.cancel();
      _bleAdapterStateStream = null;
    }
    if (_scanResultStream != null) {
      _scanResultStream?.cancel();
      _scanResultStream = null;
    }
    if (_isScanningStream != null) {
      _isScanningStream?.cancel();
      _isScanningStream = null;
    }
    if (_hrPolarStream != null) {
      _hrPolarStream?.cancel();
      _hrPolarStream = null;
    }
    if (_ecgPolarStream != null) {
      _ecgPolarStream?.cancel();
      _ecgPolarStream = null;
    }
    if (_accPolarStream != null) {
      _accPolarStream?.cancel();
      _accPolarStream = null;
    }
    if (_gyroPolarStream != null) {
      _gyroPolarStream?.cancel();
      _gyroPolarStream = null;
    }
    if (_magnetometerPolarStream != null) {
      _magnetometerPolarStream?.cancel();
      _magnetometerPolarStream = null;
    }
    if (_ppgPolarStream != null) {
      _ppgPolarStream?.cancel();
      _ppgPolarStream = null;
    }
    if (_hrCommonStream != null) {
      _hrCommonStream?.cancel();
      _hrCommonStream = null;
    }
    if (_conStateCommonStream != null) {
      _conStateCommonStream?.cancel();
      _conStateCommonStream = null;
    }
    if (_polarStateStream != null) {
      _polarStateStream?.cancel();
      _polarStateStream = null;
    }
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
              emit(state.copyWith(bleFailure: l));
            }
          },
          (device) {
            if (device.isNotEmpty) emit(state.copyWith(fDevices: device));
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
    _polarStateStream ??= _statePolarBleUsecase.call().listen((event) {
      event.fold((l) {
        if (l is BluetoothFailure) {
          emit(state.copyWith(
            conState: null,
            bleFailure: l,
            isLoading: false,
            cDevice: null,
            hrSample: null,
          ));
        }
      }, (r) {
        emit(state.copyWith(conState: r));
      });
    });
    startScan();
  }

  Future<void> startScan() async {
    await _scanCommonBLEUsecase.call(
      StartScanCommonParams(
        serviceIds: [GuidConstant.get.hrS],
        timeout: const Duration(minutes: 3),
      ),
    );
  }

  Future<void> connectToDevice(BleEntity entity) async {
    emit(state.copyWith(bleFailure: null, isLoading: true));
    if (!entity.isConnectable) {
      return;
    } else if (entity.name.contains("Polar")) {
      await connectToPolarDevice(entity);
    } else {
      await connectToCommonDevice(entity);
    }
  }

  Future<void> connectToPolarDevice(BleEntity entity) async {
    int attempt = 0;
    if (_hrPolarStream != null) {
      _hrPolarStream?.cancel();
      _hrPolarStream = null;
    }
    if (_ecgPolarStream != null) {
      _ecgPolarStream?.cancel();
      _ecgPolarStream = null;
    }
    if (_accPolarStream != null) {
      _accPolarStream?.cancel();
      _accPolarStream = null;
    }
    if (_gyroPolarStream != null) {
      _gyroPolarStream?.cancel();
      _gyroPolarStream = null;
    }
    if (_magnetometerPolarStream != null) {
      _magnetometerPolarStream?.cancel();
      _magnetometerPolarStream = null;
    }
    if (_ppgPolarStream != null) {
      _ppgPolarStream?.cancel();
      _ppgPolarStream = null;
    }
    if (entity.device.isConnected) {
      await _disconnectPolarBleDeviceUsecase.call(DisconnectPolarParams(
        deviceId: entity.polarId ?? getPolarId(entity.name),
      ));
    }
    if (entity.polarId != null) {
      final con = await _connectPolarBleUsecase.call(ConnectPolarParams(
        deviceId: entity.polarId ?? getPolarId(entity.name),
      ));

      con.fold((l) {
        if (l is BluetoothFailure) {
          if (l.message!.contains("BleDisconnected") &&
              l.message!.contains("polar")) {
            Future.delayed(
                const Duration(seconds: 1),
                () async => await _disconnectPolarBleDeviceUsecase
                        .call(DisconnectPolarParams(
                      deviceId: entity.polarId ?? getPolarId(entity.name),
                    )));

            if (attempt < 3) {
              Future.delayed(
                  const Duration(seconds: 1),
                  () async =>
                      await _connectPolarBleUsecase.call(ConnectPolarParams(
                        deviceId: entity.polarId ?? getPolarId(entity.name),
                      )));
            } else {
              emit(state.copyWith(
                cDevice: null,
                bleFailure: l,
                isLoading: false,
              ));
            }
            attempt++;
          } else {
            attempt = 0;
            emit(
                state.copyWith(cDevice: null, bleFailure: l, isLoading: false));
          }
        }
      }, (_) async {
        await discoverTypesPolar(entity);
      });
    }
  }

  Future<void> connectToCommonDevice(BleEntity entity) async {
    emit(state.copyWith(bleFailure: null, isLoading: true));
    if (_hrCommonStream != null) {
      await _hrCommonStream?.cancel();
      _hrCommonStream = null;
    }
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
        emit(state.copyWith(
          cDevice: null,
          bleFailure: l,
          isLoading: false,
        ));
        _disconnectCommonBleUsecase.call(DisconnectCommonParams(
          device: entity.device,
        ));
      }
    }, (_) async {
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
      (l) {
        if (l is BluetoothFailure) {
          clearState(f: l);
          disconnectDevice(entity);
        }
      },
      (r) {
        List<BleEntity>? nDL = [];
        BleEntity nD = entity;
        for (final e in state.fDevices) {
          if (e.polarId == entity.polarId) {
            nD = e.copyWith(
                polarServices: r, brand: nD.name.isPolar() ? "Polar" : null);
            nDL.add(nD);
          } else {
            nDL.add(e);
          }
        }
        emit(state.copyWith(
          cDevice: nD,
          fDevices: nDL.isNotEmpty ? nDL : state.fDevices,
        ));
        subscribeHrPolar(nD, r);
        subscribeEcgPolar(nD, r);
        subscribeAccPolar(nD, r);
        subscribeGyroPolar(nD, r);
        subscribeMagnetometerPolar(nD, r);
        subscribePpgPolar(nD, r);

        vibrateOnce();
      },
    );
  }

  Future<void> discoverTypesCommon(BleEntity entity) async {
    final res = await _getCommonServicesUsecase.call(GetCommonServicesParams(
      device: entity.device,
    ));
    res.fold(
      (l) {
        if (l is BluetoothFailure) {
          emit(state.copyWith(cDevice: null, bleFailure: l, isLoading: false));
        }
      },
      (r) {
        _conStateCommonStream ??= entity.device.connectionState.listen((event) {
          emit(state.copyWith(conState: event));
        });
        List<BleEntity>? nDL = [];
        BleEntity nD = entity;
        for (final e in state.fDevices) {
          if (e.address == entity.address) {
            nD = e.copyWith(commonservices: r);
            nDL.add(nD);
          } else {
            nDL.add(e);
          }
        }
        emit(state.copyWith(
          cDevice: nD,
          fDevices: nDL.isNotEmpty ? nDL : state.fDevices,
        ));
        final manu = r.any((e) => e.uuid == GuidConstant.get.diS);
        if (manu) {
          final diSc = r.firstWhere((e) => e.uuid == GuidConstant.get.diS);
          final manuC = diSc.characteristics
              .firstWhere((e) => e.characteristicUuid == GuidConstant.get.mnsC);
          _readCommonBLEUsecase
              .call(ReadCommonParams(
            characteristic: manuC,
          ))
              .then((res) {
            res.fold((l) {}, (r) {
              emit(state.copyWith(
                  cDevice: nD.copyWith(brand: r.toASCIIString())));
            });
          });
        }

        subscribeHrCommon(nD, r);
        vibrateOnce();
      },
    );
  }

  void subscribeHrPolar(BleEntity entity, Set<PolarDataType> r) {
    emit(state.copyWith(isLoading: false));
    _hrPolarStream ??= _streamHrPolarBLEUsecase
        .call(StreamPolarParams(
      deviceId: entity.polarId ?? getPolarId(entity.name),
      types: r,
    ))
        .listen((event) {
      event.fold(
        (l) {
          if (l is BluetoothFailure) {
            clearState(f: l);
          }
        },
        (r) {
          emit(state.copyWith(hrSample: r.samples.last));
        },
      );
    });
  }

  void subscribeEcgPolar(BleEntity entity, Set<PolarDataType> r) {
    _ecgPolarStream ??= _streamEcgPolarBLEUsecase
        .call(StreamPolarParams(
      deviceId: entity.polarId ?? getPolarId(entity.name),
      types: r,
    ))
        .listen((event) {
      event.fold(
        (l) {
          if (l is BluetoothFailure) {
            clearState(f: l);
          }
        },
        (r) {
          // log.d("Ecg : ${r.toJson()}");
          emit(state.copyWith(ecgSample: r.samples));
        },
      );
    });
  }

  void subscribeAccPolar(BleEntity entity, Set<PolarDataType> r) {
    _accPolarStream ??= _streamAccPolarBLEUsecase
        .call(StreamPolarParams(
      deviceId: entity.polarId ?? getPolarId(entity.name),
      types: r,
    ))
        .listen((event) {
      event.fold(
        (l) {
          if (l is BluetoothFailure) {
            clearState(f: l);
          }
        },
        (r) {
          emit(state.copyWith(accSample: r.samples.last));
        },
      );
    });
  }

  void subscribeGyroPolar(BleEntity entity, Set<PolarDataType> r) {
    _gyroPolarStream ??= _streamGyroPolarBLEUsecase
        .call(StreamPolarParams(
      deviceId: entity.polarId ?? getPolarId(entity.name),
      types: r,
    ))
        .listen((event) {
      event.fold(
        (l) {
          if (l is BluetoothFailure) {
            clearState(f: l);
          }
        },
        (r) {
          emit(state.copyWith(gyroSample: r.samples.last));
        },
      );
    });
  }

  void subscribeMagnetometerPolar(BleEntity entity, Set<PolarDataType> r) {
    _magnetometerPolarStream ??= _streamMagnetometerPolarBLEUsecase
        .call(StreamPolarParams(
      deviceId: entity.polarId ?? getPolarId(entity.name),
      types: r,
    ))
        .listen((event) {
      event.fold(
        (l) {
          if (l is BluetoothFailure) {
            clearState(f: l);
          }
        },
        (r) {
          emit(state.copyWith(magnetometerSample: r.samples.last));
        },
      );
    });
  }

  void subscribePpgPolar(BleEntity entity, Set<PolarDataType> r) {
    _ppgPolarStream ??= _streamPpgPolarBLEUsecase
        .call(StreamPolarParams(
      deviceId: entity.polarId ?? getPolarId(entity.name),
      types: r,
    ))
        .listen((event) {
      event.fold(
        (l) {
          if (l is BluetoothFailure) {
            clearState(f: l);
          }
        },
        (r) {
          emit(state.copyWith(ppgSample: r.samples.last));
        },
      );
    });
  }

  Future<void> subscribeHrCommon(
    BleEntity entity,
    List<BluetoothService> services,
  ) async {
    emit(state.copyWith(isLoading: false));
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
          if (l is BluetoothFailure) {
            clearState(f: l);
          }
        },
        (r) {
          if (r.isNotEmpty) {
            emit(state.copyWith(
                hrSample: PolarHrSample(
                    hr: r[1],
                    rrsMs: [],
                    contactStatus: false,
                    contactStatusSupported: false)));
          }
        },
      );
    });
    entity.device.cancelWhenDisconnected(_hrCommonStream!);
    if (entity.device.isConnected) {
      await hrmCr.setNotifyValue(hrmCr.isNotifying == false);
    }
  }

  void disconnectDevice(BleEntity entity) {
    clearState();
    if (entity.name.contains("Polar")) {
      if (_hrPolarStream != null) {
        _hrPolarStream?.cancel();
      }
      _hrPolarStream = null;
      if (_ecgPolarStream != null) {
        _ecgPolarStream?.cancel();
      }
      _ecgPolarStream = null;
      if (_accPolarStream != null) {
        _accPolarStream?.cancel();
      }
      _accPolarStream = null;
      if (_gyroPolarStream != null) {
        _gyroPolarStream?.cancel();
      }
      _gyroPolarStream = null;
      if (_magnetometerPolarStream != null) {
        _magnetometerPolarStream?.cancel();
      }
      _magnetometerPolarStream = null;
      if (_ppgPolarStream != null) {
        _ppgPolarStream?.cancel();
      }
      _ppgPolarStream = null;
      _disconnectPolarBleDeviceUsecase.call(DisconnectPolarParams(
        deviceId: entity.polarId ?? getPolarId(entity.name),
      ));
    } else {
      if (_hrCommonStream != null) {
        entity.device.cancelWhenDisconnected(_hrCommonStream!);
        _hrCommonStream?.cancel();
        _hrCommonStream = null;
      }
      if (_conStateCommonStream != null) {
        _conStateCommonStream?.cancel();
        _conStateCommonStream = null;
      }
      _disconnectCommonBleUsecase.call(DisconnectCommonParams(
        device: entity.device,
      ));
    }
  }

  void clearState({BluetoothFailure? f}) => emit(state.copyWith(
        bleFailure: f,
        isLoading: false,
        hrSample: null,
        ecgSample: null,
        accSample: null,
        gyroSample: null,
        magnetometerSample: null,
        ppgSample: null,
        cDevice: null,
      ));

  String getPolarId(String commonName) {
    return commonName.split(' ').last;
  }
}
