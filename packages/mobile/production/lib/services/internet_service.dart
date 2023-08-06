import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/models/auth_model.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/utils/preferences_provider.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class InternetService {
  final _getConnect = GetConnect();

  GetConnect get getConnect => _getConnect;

  final _prefs = PreferencesProvider();

  Future postSession(dynamic body) async {
    final token = await _prefs.getUserToken();
    try {
      final response = await _getConnect.post(
        "${dotenv.env['API_BASE_URL'] ?? ''}/session",
        jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
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
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/exercise";

    final response = await _getConnect.get(url);
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
    final token = await _prefs.getUserToken();
    try {
      final response = await _getConnect
          .get("${dotenv.env['API_BASE_URL'] ?? ''}/session", headers: {
        'Authorization': 'Bearer $token',
      });
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
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/report/$exerciseId";

    final response = await _getConnect.get(url);
    try {
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

  Future<Response> registerUser(AuthModel request) async {
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/auth/register";
    final AuthModel data = request;
    try {
      final response = await _getConnect.post(
        url,
        jsonEncode(data.toJson()),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response;
    } catch (e) {
      return Response(body: 'Error $e');
    }
  }

  Future<Response> loginUser(AuthModel request) async {
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/auth/login";
    final String email = request.email!;
    final String password = request.password!;
    try {
      final response = await _getConnect.post(
        url,
        jsonEncode({
          'email': email,
          'password': password,
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
