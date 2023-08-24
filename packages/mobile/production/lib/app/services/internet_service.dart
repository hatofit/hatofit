import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/services/storage_service.dart';

enum ApiPath {
  exercise,
  session,
  report,
  register,
  login,
}

class InternetService extends GetConnect {
  final _prefs = PreferencesService();
  String? get token => _prefs.token;

  Future<InternetService> init() async {
    await dotenv.load(fileName: ".env");
    return this;
  }

  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env['API_BASE_URL'];
    super.onInit();
  }

  Future postSession(dynamic body) async {
    try {
      final response = await post(
        '/${ApiPath.session}',
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
      '/${ApiPath.exercise}',
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
        "/${ApiPath.session}",
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
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/report/$exerciseId";

    final response = await get(url);
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

  Future<Response> registerUser(UserModel request) async {
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/User/register";
    final UserModel data = request;
    try {
      final response = await post(
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

  Future<Response> loginUser(UserModel request) async {
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/User/login";
    final String email = request.email!;
    final String password = request.password!;
    try {
      final response = await post(
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
