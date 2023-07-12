import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class InternetService extends GetxController {
  final _getConnect = GetConnect();
  final isInternetAvailable = false.obs;

  GetConnect get getConnect => _getConnect;

  @override
  void onInit() {
    checkInternetConnection();
    super.onInit();
  }

  void checkInternetConnection() async {
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/exercise";
    final response = await _getConnect.get(url);
    if (response.statusCode == 200) {
      isInternetAvailable.value = true;
    } else {
      isInternetAvailable.value = false;
    }
    update();
  }

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
        isInternetAvailable.value = true;
        return response.body;
      } else {
        isInternetAvailable.value = false;
        return response.body;
      }
    } catch (e) {
      return e;
    }
  }

  Future<List<ExerciseModel>> fetchExercises() async {
    final url = "${dotenv.env['API_BASE_URL'] ?? ''}/exercise";
    final response = await _getConnect.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = response.body['exercises'];
      StorageService().saveToJSON('exercise', jsonResponse);
      return jsonResponse.map<ExerciseModel>((json) {
        return ExerciseModel.fromJson(json);
      }).toList();
    } else {
      List<dynamic> jsonResponse =
          await StorageService().readFromJSON('exercise');
      return jsonResponse.map<ExerciseModel>((json) {
        return ExerciseModel.fromJson(json);
      }).toList();
    }
  }

  @override
  void onClose() {
    _getConnect.dispose();
    super.onClose();
  }
}
