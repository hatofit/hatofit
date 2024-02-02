import 'package:dartz/dartz.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class GetHrCommonUsecase extends StreamUseCase<List<int>, BluetoothParams> {
  final BluetoothRepository _repo;

  GetHrCommonUsecase(this._repo);

  @override
  Stream<Either<Failure, List<int>>> call(BluetoothParams params) =>
      _repo.streamHRCommon(params);
}
