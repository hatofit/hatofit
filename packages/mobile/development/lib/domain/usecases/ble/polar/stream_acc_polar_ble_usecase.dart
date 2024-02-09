import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:polar/polar.dart';

class StreamAccPolarBLEUsecase
    extends SUC<PolarStreamingData<PolarAccSample>, StreamPolarParams> {
  final PolarBLERepo _repo;

  StreamAccPolarBLEUsecase(this._repo);

  @override
  Stream<Either<Failure, PolarStreamingData<PolarAccSample>>> call(
          StreamPolarParams params) =>
      _repo.streamAcc(params);
}
