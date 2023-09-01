import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/models/report_model.dart';
import 'package:hatofit/app/models/session_model.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/utils/debug_logger.dart';
import 'package:hatofit/utils/isolates.dart';

import 'preferences_service.dart';

class InternetProvider {
  static const String _base = 'http://192.168.33.169:3000/api';
  static const String _sesion = '/session';
  static const String _exercise = '/exercise';
  static const String _report = '/report';
  static const String _register = '/auth/register';
  static const String _login = '/auth/login';

  final dio = Dio(BaseOptions(baseUrl: _base, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${Get.find<PreferencesService>().token}',
  }));

  Future<List<ExerciseModel>?> getExercises() async {
    try {
      final res = await dio.get(
        _exercise,
      );
      final data = _handleResponse(res);
      if (data != null) {
        final List<dynamic> exercises = data['exercises'];
        final exc = await compute(exerciseModelFromJson, exercises);
        return exc;
      }
    } on DioException catch (_) {
      Get.snackbar(
        'Connection Error',
        'Cannot connect to server',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
      return null;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
      return null;
    }
    return null;
  }

  Future<void> postSession(SessionModel body) async {
    logger.i(body.toJson());
    if (body.data.last.devices.last.value.isEmpty) {
      return;
    }
    final json = body.toJson();
    json.removeWhere((key, value) => value == null);
    try {
      final res = await dio.post(
        _sesion,
        data: jsonEncode(json),
      );
      final data = _handleResponse(res);
      if (data != null) {
        Get.snackbar(
          'Success',
          'Session saved',
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
      }
    } on DioException catch (_) {
      Get.snackbar(
        'Connection Error',
        'Cannot connect to server',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
    }
  }

  Future<List<SessionModel>?> getSession() async {
    try {
      final res = await dio.get(
        _sesion,
      );
      final data = _handleResponse(res);
      if (data != null) {
        final List<dynamic> sessions = data['sessions'];
        final exc = await compute(sessionModelFromJson, sessions);
        return exc;
      }
    } on DioException catch (_) {
      Get.snackbar(
        'Connection Error',
        'Cannot connect to server',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
      return null;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
      return null;
    }
    return null;
  }

  Future<ReportModel?> getReport(String exerciseId) async {
    try {
      final res = await dio.get(
        '$_report/$exerciseId',
      );
      final data = _handleResponse(res);
      if (data != null) {
        return ReportModel.fromJson(data['report']);
      }
    } on DioException catch (_) {
      Get.snackbar(
        'Connection Error',
        'Cannot connect to server',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
      return null;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
      return null;
    }
    return null;
  }

  Future<bool> registerUser(UserModel request) async {
    final bodyMap = request.toJson();
    bodyMap.removeWhere((key, value) => value == null);
    try {
      final response = await dio.post(
        _register,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode(bodyMap),
      );
      final data = _handleResponse(response);
      if (data != null) {
        return true;
      }
    } on DioException catch (_) {
      Get.snackbar(
        'Connection Error',
        'Cannot connect to server',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
      return false;
    }
    return false;
  }

  Future<bool> loginUser(UserModel request) async {
    try {
      final response = await dio.post(
        _login,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({
          'email': request.email,
          'password': request.password,
        }),
      );
      final data = _handleResponse(response);
      if (data != null) {
        Get.find<PreferencesService>().token = data['token'];
        return true;
      }
    } on DioException catch (_) {
      Get.snackbar(
        'Connection Error',
        'Cannot connect to server',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      );
      return false;
    }
    return false;
  }

  static _handleResponse(Response res) {
    switch (res.statusCode) {
      case 200:
        return res.data;
      case 400:
        Get.snackbar(
          'Invalid Request',
          res.data['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
      case 401:
        Get.snackbar(
          'Unauthorized',
          res.data['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
      case 403:
        Get.snackbar(
          'Forbidden',
          res.data['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
      case 404:
        Get.snackbar(
          'Not Found',
          res.data['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
      case 500:
        Get.snackbar(
          'Internal Server Error',
          res.data['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
      default:
        Get.snackbar(
          'Error',
          res.data['message'],
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        );
        return null;
    }
  }
}
