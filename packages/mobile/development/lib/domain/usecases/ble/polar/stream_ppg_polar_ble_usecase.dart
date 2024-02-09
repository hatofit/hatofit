import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

class StreamPpgPolarBLEUsecase
    extends SUC<PolarStreamingData<PolarPpgSample>, StreamPolarParams> {
  final PolarBLERepo _repo;

  StreamPpgPolarBLEUsecase(this._repo);

  @override
  Stream<Either<Failure, PolarStreamingData<PolarPpgSample>>> call(
          StreamPolarParams params) =>
      _repo.streamPpg(params);
}
