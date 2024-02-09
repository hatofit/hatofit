import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

class StreamGyroPolarBLEUsecase
    extends SUC<PolarStreamingData<PolarGyroSample>, StreamPolarParams> {
  final PolarBLERepo _repo;

  StreamGyroPolarBLEUsecase(this._repo);

  @override
  Stream<Either<Failure, PolarStreamingData<PolarGyroSample>>> call(
          StreamPolarParams params) =>
      _repo.streamGyro(params);
}
