import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

class StreamHrPolarBLEUsecase
    extends SUC<PolarStreamingData<PolarHrSample>, StreamPolarParams> {
  final PolarBLERepo _repo;

  StreamHrPolarBLEUsecase(this._repo);

  @override
  Stream<Either<Failure, PolarStreamingData<PolarHrSample>>> call(
          StreamPolarParams params) =>
      _repo.streamHr(params);
}
