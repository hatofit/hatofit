import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../app/core/domain/failure.dart';
import '../../../../app/core/domain/success.dart';
import '../../../../domain/usecases/handle_response.dart';
import 'api_request.dart';

class ApiSource {
  static const rto = Duration(seconds: 15);
  final _client = GetConnect(timeout: rto);

  static final _singleton = ApiSource();
  static ApiSource get instance => _singleton;

  Future<Either<Failure, Success>> request(APIRequest request) async {
    final response = await _client.request(
      request.url,
      request.method.string,
      headers: request.headers,
      body: request.body,
    );
    return handleResponse(response);
  }
}
