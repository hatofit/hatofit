import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:path_provider/path_provider.dart';

typedef JSONIConv<T> = T Function(dynamic response);

class DioClient with FirebaseCrashLogger {
  String? _auth;
  late Dio _dio;
  final BoxClient _boxClient;

  DioClient(this._boxClient) {
    try {
      _auth = _boxClient.userBox.get(UserBoxKeys.token.name);
      _dio = _createDio();
      // _dio.interceptors.add(DioInterceptor());
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
  }

  Dio get dio {
    try {
      _auth = _boxClient.userBox.get(UserBoxKeys.token.name);
      _dio = _createDio();
      // _dio.interceptors.add(DioInterceptor());
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
    return _dio;
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: APIConstant.get.baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (_auth != null) ...{
              'Authorization': "Bearer $_auth",
            },
          },
          receiveTimeout: const Duration(minutes: 1),
          connectTimeout: const Duration(minutes: 1),
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );

  Future<Either<Failure, T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    required JSONIConv<T> converter,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      final isolateParse = JSONIParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();

      return Right(result);
    } on DioException catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);

      if (e.response?.statusCode == 404) {
        return const Left(
          ServerFailure(
            message: "Internal Server Error",
          ),
        );
      }
      return Left(
        ServerFailure(
          message: e.response == null
              ? e.message
              : e.response?.data['message'] as String? ??
                  "Internal Server Error",
          exception: e,
        ),
      );
    }
  }

  Future<Either<Failure, T>> postRequest<T>(
    String url, {
    Map<String, dynamic>? data,
    FormData? formData,
    JSONIConv<T>? converter,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data ?? formData,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      if (converter == null) {
        return Right(response.data as T);
      } else {
        final isolateParse = JSONIParser<T>(
          response.data as Map<String, dynamic>,
          converter,
        );
        final result = await isolateParse.parseInBackground();
        return Right(result);
      }
    } on DioException catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      return Left(
        ServerFailure(
          message: e.response == null
              ? e.message
              : e.response?.data['message'] as String? ??
                  "Internal Server Error",
          exception: e,
        ),
      );
    }
  }

  Future<Either<Failure, T>> putRequest<T>(
    String url, {
    Map<String, dynamic>? data,
    FormData? formData,
    JSONIConv<T>? converter,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: data ?? formData,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (converter == null) {
        return Right(response.data as T);
      } else {
        final isolateParse = JSONIParser<T>(
          response.data as Map<String, dynamic>,
          converter,
        );
        final result = await isolateParse.parseInBackground();
        return Right(result);
      }
    } on DioException catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      return Left(
        ServerFailure(
          message: e.response == null
              ? e.message
              : e.response?.data['message'] as String? ??
                  "Internal Server Error",
          exception: e,
        ),
      );
    }
  }

  Future<Either<Failure, T>> deleteRequest<T>(
    String url, {
    Map<String, dynamic>? data,
    JSONIConv<T>? converter,
  }) async {
    try {
      final response = await dio.delete(
        url,
        data: data,
      );
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      if (converter == null) {
        return Right(response.data as T);
      } else {
        final isolateParse = JSONIParser<T>(
          response.data as Map<String, dynamic>,
          converter,
        );
        final result = await isolateParse.parseInBackground();
        return Right(result);
      }
    } on DioException catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      return Left(
        ServerFailure(
          message: e.response == null
              ? e.message
              : e.response?.data['message'] as String? ??
                  "Internal Server Error",
          exception: e,
        ),
      );
    }
  }

  Future<Either<Failure, File>> downloadRequest(
    String url,
    String savePath, {
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final defaultPath = (await getExternalStorageDirectory())?.path;
      final response = await Dio().download(
        url,
        "$defaultPath/$savePath",
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return Right(File(savePath));
    } on DioException catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      return Left(
        ServerFailure(
          message: e.response == null
              ? e.message
              : e.response?.data['message'] as String? ??
                  "Internal Server Error",
          exception: e,
        ),
      );
    }
  }
}
