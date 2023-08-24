import 'dart:convert';

import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:hatofit/utils/debug_logger.dart';

class InternetService extends GetConnect {
  final store = Get.find<PreferencesService>();
  String get token => store.token ?? '';
  Future<InternetService> init() async {
    return this;
  }

  static const String _base = 'http://192.168.215.169:3000/api';

  static const String _sesion = '/session';
  static const String _exercise = '/exercise';
  static const String _report = '/report';
  static const String _register = '/auth/register';
  static const String _login = '/auth/login';

  Future postSession(dynamic body) async {
    logger.d('Post Session\n$body\n/${_base + _sesion}}\n token:$token');
    try {
      final response = await post(
        _base + _sesion,
        jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Userorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }

  Future<List<ExerciseModel>> fetchExercises() async {
    final response = await get(
      _base + _exercise,
    );
    try {
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
      return List<ExerciseModel>.empty();
    }
  }

  Future<List<dynamic>> fetchHistory() async {
    try {
      final response = await get(
        _base + _sesion,
        headers: {
          'Userorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.body['sessions'];
        return jsonResponse;
      } else {
        return List<dynamic>.empty();
      }
    } catch (e) {
      return List<dynamic>.empty();
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
    logger.i(
        'Register User\n$bodyMap\n/${_base + _register}} /n base:${httpClient.baseUrl}}');
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
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }
}
