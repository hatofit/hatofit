import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/modules/auth/data/models/login_response_model.dart';
import 'package:hatofit/modules/auth/data/models/register_response_model.dart';
import 'package:hatofit/modules/auth/domain/usecases/login/login_usecase.dart';
import 'package:hatofit/modules/auth/domain/usecases/register/register_usecase.dart';

abstract class AuthAbsRepository {
  Future<Either<Failure, LoginResponseModel>> login(LoginParams request);
  Future<Either<Failure, RegisterResponseModel>> register(RegisterParams request); 
}
