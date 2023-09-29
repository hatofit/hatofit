import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/models/session_model.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:hatofit/utils/debug_logger.dart';

class InternetService extends GetConnect {
  final store = Get.find<PreferencesService>();
  String get token => store.token ?? '';

  Future<InternetService> init() async {
    final res = await fetchHistory();
    if (res.statusText! == 'OK') {
      if (res.body['success'] == false) {
        store.token = null;
      }
    } else if (res.statusText!.contains('connection timed out')) {
      return this;
    }
    return this;
  }

  static const String _base = 'http://192.168.177.169:3000/api';
  static const String _sesion = '/session';
  static const String _exercise = '/exercise';
  static const String _report = '/report';
  static const String _register = '/auth/register';
  static const String _login = '/auth/login';
  static const String _update = '/auth/update';

  Future<int?> postSession(SessionModel body) async {
    if (body.data.last.devices.last.value.isEmpty) {
      return null;
    }
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

  Future<List<ExerciseModel>?> fetchExercises() async {
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
      logger.f(token);
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
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }

  Future<Response> updateUser(UserModel request) async {
    try {
      final response = await post(
        _base + _update,
        jsonEncode(
          request.toJson(),
        ),
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

  static Response? _handleResponse(Response res) {
    switch (res.statusCode) {
      case 200:
        return res;
      case 400:
        Get.snackbar(
          'Invalid Request',
          res.body['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
      case 401:
        Get.snackbar(
          'Unauthorized',
          res.body['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
      case 403:
        Get.snackbar(
          'Forbidden',
          res.body['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
      case 404:
        Get.snackbar(
          'Not Found',
          res.body['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
      case 500:
        Get.snackbar(
          'Internal Server Error',
          res.body['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
      default:
        Get.snackbar(
          'Error',
          res.body['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
    }
  }
}
