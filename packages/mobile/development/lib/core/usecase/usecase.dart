import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';

// FPUC = Future Params Use Case
abstract class FPUC<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// FNPUC = Future No Params Use Case
abstract class FNPUC<Type> {
  Future<Either<Failure, Type>> call();
}

// SUC = Stream Use Case
abstract class SUC<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}

// SNPC = Stream No Params Use Case
abstract class SNPC<Type> {
  Stream<Either<Failure, Type>> call();
}

// EPUC = Either Params Use Case
abstract class EPUC<Type, Params> {
  Either<Failure, Type> call(Params params);
}

// ENPUC = Either No Params Use Case
abstract class ENPUC<Type> {
  Either<Failure, Type> call();
}
