import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

class StreamMagnetometerPolarBLEUsecase extends SUC<
    PolarStreamingData<PolarMagnetometerSample>, StreamPolarParams> {
  final PolarBLERepo _repo;

  StreamMagnetometerPolarBLEUsecase(this._repo);

  @override
  Stream<Either<Failure, PolarStreamingData<PolarMagnetometerSample>>> call(
          StreamPolarParams params) =>
      _repo.streamMagnetometer(params);
}
