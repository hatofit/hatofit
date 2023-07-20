import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class InternetService {
  final _getConnect = GetConnect();

  GetConnect get getConnect => _getConnect;

  Future postSession(dynamic body) async {
    try {
      final response = await _getConnect.post(
        "${dotenv.env['API_BASE_URL'] ?? ''}/session",
        jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
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
    try {
      final response = await _getConnect.get(
        "${dotenv.env['API_BASE_URL'] ?? ''}/session",
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

  Future<String> registerUser(dynamic body) {
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/auth/register";
    try {
      final response = _getConnect.post(
        url,
        jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response.then((value) {
        if (value.statusCode == 200) {
          return 'Success Register';
        } else {
          return 'Failed Register';
        }
      });
    } catch (e) {
      print(
        "========\n"
        "Error $e\n"
        "========\n",
      );
      return Future.value('Error $e');
    }
  }

  Future<dynamic> loginUser(String email, String password) {
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/auth/login";
    try {
      final response = _getConnect.post(
        url,
        jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      return response.then((value) {
        if (value.statusCode == 200) {
          return value.body;
        } else {
          return 'Failed Login';
        }
      });
    } catch (e) {
      return Future.value('Error $e');
    }
  }
}
