import 'dart:convert';

import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/models/session_model.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:logger/logger.dart';

class InternetService extends GetConnect {
  final store = Get.find<PreferencesService>();
  String get token => store.token ?? '';

  Future<InternetService> init() async {
    final res = await getUser();
    if (res.statusText! == 'OK') {
      if (res.body['success'] == false) {
        store.token = null;
      }
    } else if (res.statusText!.contains('connection timed out')) {
      return this;
    }
    return this;
  }

  static const String _base = 'https://api.hatofit.com/api';
  // static const String _base = 'http://192.168.124.169:3000/api';
  static const String _sesion = '/session';
  static const String _exercise = '/exercise';
  static const String _report = '/report';
  static const String _register = '/auth/register';
  static const String _login = '/auth/login';
  static const String _update = '/auth/update';
  static const String _updateMetrices = '/auth/update-metric';
  static const String _me = '/auth/me';
  static const String _forgetPassword = '/auth/forgot-password';
  static const String _verifyCode = '/auth/verify-code';
  static const String _resetPassword = '/auth/reset-password';

  Future<int?> postSession(SessionModel body) async {
    final json = body.toJson();
    json.removeWhere((key, value) => value == null);
    try {
      final response = await post(
        _base + _sesion,
        jsonEncode(json),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<ExerciseModel>?> fetchExercises({required bool showFromCompany}) async {
    try {
      final response = await get(
        "$_base$_exercise?showFromCompany=$showFromCompany",
      );
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.body['exercises'];
        StorageService().saveToJSON('exercise/exercise', jsonResponse);
        return jsonResponse.map<ExerciseModel>((json) {
          return ExerciseModel.fromJson(json);
        }).toList();
      } else {
        List<dynamic> jsonResponse =
            await StorageService().readFromJSON('exercise/exercise');
        return jsonResponse.map<ExerciseModel>((json) {
          return ExerciseModel.fromJson(json);
        }).toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchHistory() async {
    try {
      final response = await get(
        _base + _sesion,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }

  Future<Map<String, dynamic>> fetchReport(String exerciseId) async {
    try {
      final response = await get(
        '$_base$_report/$exerciseId',
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.body;

        return jsonResponse;
      } else {
        return List<dynamic>.empty() as Map<String, dynamic>;
      }
    } catch (e) {
      return List<dynamic>.empty() as Map<String, dynamic>;
    }
  }

  Future<Response> registerUser(UserModel request) async {
    final bodyMap = request.toJson();
    bodyMap.removeWhere((key, value) => value == null);
    try {
      final response = await post(
        _base + _register,
        jsonEncode(bodyMap),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }

  Future<Response> loginUser(UserModel request) async {
    try {
      final response = await post(
        _base + _login,
        jsonEncode({
          'email': request.email,
          'password': request.password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      Logger().e(_base + _login);
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }

  Future<Response> updateUser(UserModel request) async {
    final bodyMap = request.toJson();
    bodyMap.removeWhere((key, value) => value == null);
    try {
      final response = await post(
        _base + _update,
        jsonEncode(bodyMap),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }

  Future<Response> updateMetrices(
      int height, int weight, MetricUnits units) async {
    try {
      final response = await post(
        _base + _updateMetrices,
        jsonEncode({
          'height': height,
          'weight': weight,
          'metricUnits': units.toJson(),
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }

  Future<Response> getUser() async {
    try {
      final token = store.token;
      final response = await get(_base + _me, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }

  Future<Response> forgetPassword(String email) async {
    try {
      final response = await get(
        '$_base$_forgetPassword/$email',
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }

  Future<Response> verifyCode(String email, String code) async {
    try {
      final response = await post(
        '$_base$_verifyCode',
        jsonEncode({
          'email': email,
          'code': code,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }

  Future<Response> resetPassword(String email, String code, String password,
      String confirmPassword) async {
    try {
      final response = await post(
        '$_base$_resetPassword',
        jsonEncode({
          'email': email,
          'code': code,
          'password': password,
          'confirmPassword': confirmPassword,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }
}
