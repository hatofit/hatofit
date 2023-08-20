import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/services/local_storage.dart';
import 'package:hatofit/app/services/polar_service.dart';
import 'package:hatofit/data/models/session.dart';
import 'package:hatofit/domain/usecases/api/sesion/save_session_api_uc.dart';

class WoCon extends GetxController {
  final SaveSessionApiUc _saveSessionApiUc;
  WoCon(this._saveSessionApiUc);
  final store = Get.find<LocalStorageService>();

  ///
  /// General
  ///
  final isWOStart = false.obs;
  final PolarService _pCon = Get.find<PolarService>();

  Future<void> postSession(Session session) async {
    try {
      final token = store.token;
      final res = await _saveSessionApiUc.execute(Tuple2(session, token!));
      res.fold((failure) {
        Get.snackbar(failure.message, failure.details);
      }, (success) {
        Get.snackbar('Success', 'Session saved');
      });
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  ///
  /// Free Workout
  ///
  Session? session;

  void getData() {
    session = _pCon.sessMod.value;
  }

  void savePrompt() {
    getData();

  }
}
