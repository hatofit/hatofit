import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';

abstract class WithParamsUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class NoParamsUseCase<Type> {
  Future<Either<Failure, Type>> call();
}

abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}

abstract class StreamNoParamsUseCase<Type> {
  Stream<Either<Failure, Type>> call();
}