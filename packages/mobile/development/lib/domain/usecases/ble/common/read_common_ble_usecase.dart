import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ReadCommonBLEUsecase extends FPUC<List<int>, ReadCommonParams> {
  final CommonBLERepo _repo;

  ReadCommonBLEUsecase(this._repo);

  @override
  Future<Either<Failure, List<int>>> call(ReadCommonParams params) =>
      _repo.readCharacteristic(params);
}
