import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/helper/logger.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._connectBluetoothUsecase,
    this._scanBluetoothUsecase,
    this._requestBluetoothUsecase,
  ) : super(_Initial());
  final ConnectBluetoothUsecase _connectBluetoothUsecase;
  final ScanBluetoothUsecase _scanBluetoothUsecase;
  final RequestBluetoothUsecase _requestBluetoothUsecase;
  void scan() async {
    await _requestBluetoothUsecase();
    final scan = _scanBluetoothUsecase();
    scan.listen((event) {
      log?.i("Scan Bluetooth: $event");
    });
  }

  void streamScan() async {}

  void findDevs() {}

  void req() async {
    await _requestBluetoothUsecase();
  }
}
