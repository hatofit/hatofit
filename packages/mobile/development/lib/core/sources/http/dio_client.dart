import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient with MainBoxMixin, FirebaseCrashLogger {
  static String baseUrl = 'http://192.168.161.169:3000';

  String? _auth;
  late Dio _dio;

  DioClient() {
    try {
      _auth = getData(MainBoxKeys.token);
      _dio = _createDio();
      _dio.interceptors.add(DioInterceptor());
    } catch (error, stackTrace) {
      log?.e("""[DioClient] || DioClient() || core/api/dio_client.dart\n
      Error: $error\n
      """);
      nonFatalError(error: error, stackTrace: stackTrace);
    }
  }

  Dio get dio {
    try {
      _auth = getData(MainBoxKeys.token);
      _dio = _createDio();
      _dio.interceptors.add(DioInterceptor());
    } catch (e) {
      log?.e("""[DioClient] || Dio get dio || core/api/dio_client.dart\n
      Error: $e\n
      """);
    }
    return _dio;
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: baseUrl,
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
    required ResponseConverter<T> converter,
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

      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();

      return Right(result);
    } on DioException catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      return Left(
        ServerFailure(
          e.response == null
              ? e.message
              : e.response?.data['message'] as String? ??
                  "Internal Server Error",
        ),
      );
    }
  }

  Future<Either<Failure, T>> postRequest<T>(
    String url, {
    Map<String, dynamic>? data,
    FormData? formData,
    ResponseConverter<T>? converter,
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
        final isolateParse = IsolateParser<T>(
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
          e.response == null
              ? e.message
              : e.response?.data['message'] as String? ??
                  "Internal Server Error",
        ),
      );
    }
  }

  Future<Either<Failure, T>> putRequest<T>(
    String url, {
    Map<String, dynamic>? data,
    FormData? formData,
    ResponseConverter<T>? converter,
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
        final isolateParse = IsolateParser<T>(
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
          e.response == null
              ? e.message
              : e.response?.data['message'] as String? ??
                  "Internal Server Error",
        ),
      );
    }
  }

  Future<Either<Failure, T>> deleteRequest<T>(
    String url, {
    Map<String, dynamic>? data,
    ResponseConverter<T>? converter,
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
        final isolateParse = IsolateParser<T>(
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
          e.response == null
              ? e.message
              : e.response?.data['message'] as String? ??
                  "Internal Server Error",
        ),
      );
    }
  }
}
