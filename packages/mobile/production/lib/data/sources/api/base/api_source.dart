import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

import '../../../../app/core/domain/failure.dart';
import '../../../../app/core/domain/success.dart';
import 'api_request.dart';

class ApiSource {
  static const rto = Duration(seconds: 30);
  final _client = GetConnect(timeout: rto);

  static final _singleton = ApiSource();
  static ApiSource get instance => _singleton;

  Future request(APIRequest request) async {
    try {
      final response = await _client.request(
        request.url,
        request.method.string,
        headers: request.headers,
        body: request.body,
      );
      return _handleResponse(response);
    } on TimeoutException catch (_) {
      return Failure(
          code: 'RTO',
          message: 'Request Timeout',
          details: 'Server took too long to respond');
    } on SocketException {
      return Failure(
          code: 'NO_INTERNET',
          message: 'No Internet Connection',
          details: 'You are not connected to the internet');
    } on FormatException {
      return Failure(
          code: 'INVALID_RESPONSE',
          message: 'Invalid Response',
          details: 'Received an invalid response from the server');
    }
  }

  static _handleResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return Success(
            code: 'OK', message: response.body['message'], data: response);
      case 400:
        return Failure(
            code: 'BAD_REQUEST',
            message: 'Bad Request',
            details: response.body['message']);
      case 401:
        return Failure(
            code: 'UNAUTHORIZED',
            message: 'Unauthorized',
            details: response.body['message']);
      case 403:
        return Failure(
            code: 'FORBIDDEN',
            message: 'Forbidden',
            details: response.body['message']);
      case 404:
        return Failure(
            code: 'NOT_FOUND',
            message: 'Not Found',
            details: response.body['message']);
      case 500:
        return Failure(
            code: 'SERVER_ERROR',
            message: 'Server Error',
            details: response.body['message']);
      default:
        return Failure(
            code: 'UNKNOWN_ERROR',
            message: 'Unknown Error',
            details: response.body['message']);
    }
  }
}
