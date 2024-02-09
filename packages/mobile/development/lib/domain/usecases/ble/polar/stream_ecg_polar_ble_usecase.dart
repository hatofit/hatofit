import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

class StreamEcgPolarBLEUsecase
    extends SUC<PolarStreamingData<PolarEcgSample>, StreamPolarParams> {
  final PolarBLERepo _repo;

  StreamEcgPolarBLEUsecase(this._repo);

  @override
  Stream<Either<Failure, PolarStreamingData<PolarEcgSample>>> call(
          StreamPolarParams params) =>
      _repo.streamEcg(params);
}
