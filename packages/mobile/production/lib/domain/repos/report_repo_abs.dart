import 'package:dartz/dartz.dart';
import 'package:hatofit/app/core/domain/failure.dart';
import 'package:hatofit/app/core/domain/success.dart';

abstract class ReportRepoAbs {
  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchReportLocal(
      String id);

  Future<Either<Failure, Success<Map<String, dynamic>>>> fetchReportApi(
      String id);
}
