import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class StreamCommonBLEUsecase extends SUC<List<int>, StreamCommonParams> {
  final CommonBLERepo _repo;

  StreamCommonBLEUsecase(this._repo);

  @override
  Stream<Either<Failure, List<int>>> call(StreamCommonParams params) =>
      _repo.subscribeToCharacteristic(params);
}
