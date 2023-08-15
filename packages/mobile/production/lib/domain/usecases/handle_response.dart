import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../../app/core/domain/failure.dart';
import '../../app/core/domain/success.dart';

Either<Failure, Success> handleResponse(Response<dynamic> response) {
  if (response.statusCode == null) {
    final error =
        response.statusText!.split('SocketException: ')[1].split(' ')[0];
    if (error == 'Connection') {
      return Left(Failure(
        code: 'NO_INTERNET',
        message: 'No Internet Connection',
        details: 'You are not connected to the internet',
      ));
    } else {
      return Left(Failure(
        code: 'RTO',
        message: 'Request Timeout',
        details: 'Server took too long to respond',
      ));
    }
  } else {
    switch (response.statusCode) {
      case 200:
        return Right(Success(
          code: 'OK',
          message: response.body['message'],
          data: response.body,
        ));
      case 400:
        return Left(Failure(
          code: 'BAD_REQUEST',
          message: 'Bad Request',
          details: response.body['message'],
        ));
      case 401:
        return Left(Failure(
          code: 'UNAUTHORIZED',
          message: 'Unauthorized',
          details: response.body['message'],
        ));
      case 403:
        return Left(Failure(
          code: 'FORBIDDEN',
          message: 'Forbidden',
          details: response.body['message'],
        ));
      case 404:
        return Left(Failure(
          code: 'NOT_FOUND',
          message: 'Not Found',
          details: response.body['message'],
        ));
      case 500:
        return Left(Failure(
          code: 'SERVER_ERROR',
          message: 'Server Error',
          details: response.body['message'],
        ));
      default:
        return Left(Failure(
          code: 'UNKNOWN_ERROR',
          message: 'Unknown Error',
          details: '',
        ));
    }
  }
}
