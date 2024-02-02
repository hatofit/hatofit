import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

class GetHrPolarUsecase
    extends StreamUseCase<PolarStreamingData<PolarHrSample>, BluetoothParams> {
  final BluetoothRepository _repo;

  GetHrPolarUsecase(this._repo);

  @override
  Stream<Either<Failure, PolarStreamingData<PolarHrSample>>> call(BluetoothParams params) =>
      _repo.streamHRPolar(params);
}
