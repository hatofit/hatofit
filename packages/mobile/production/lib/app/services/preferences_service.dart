import 'dart:convert';

import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  user,
  token,
  isDarkMode,
  isSyncGoogleFit,
  todayMood,
  photoProfile,
}

class PreferencesService extends GetxService {
  SharedPreferences? _prefs;
  Future<PreferencesService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  UserModel? get user {
    final rawJson = _prefs?.getString(_Key.user.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return UserModel.fromJson(map);
  }

  set user(UserModel? value) {
    if (value != null) {
      _prefs?.setString(_Key.user.toString(), json.encode(value.toJson()));
    } else {
      _prefs?.remove(_Key.user.toString());
    }
  }

  String? get token => _prefs?.getString(_Key.token.toString());

  set token(String? value) {
    if (value != null) {
      _prefs?.setString(_Key.token.toString(), value);
    } else {
      _prefs?.remove(_Key.token.toString());
    }
  }

  bool? get isDarkMode => _prefs?.getBool(_Key.isDarkMode.toString());

  Map<String, String>? get todayMood {
    final rawJson = _prefs?.getString(_Key.todayMood.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return map.cast<String, String>();
  }

  set todayMood(Map<String, String>? value) {
    if (value != null) {
      _prefs?.setString(_Key.todayMood.toString(), json.encode(value));
    } else {
      _prefs?.remove(_Key.todayMood.toString());
    }
  }

  set isDarkMode(bool? value) {
    if (value != null) {
      _prefs?.setBool(_Key.isDarkMode.toString(), value);
    } else {
      _prefs?.remove(_Key.isDarkMode.toString());
    }
  }

  bool? get isSyncGoogleFit => _prefs?.getBool(_Key.isSyncGoogleFit.toString());

  set isSyncGoogleFit(bool? value) {
    if (value != null) {
      _prefs?.setBool(_Key.isSyncGoogleFit.toString(), value);
    } else {
      _prefs?.remove(_Key.isSyncGoogleFit.toString());
    }
  }

  Future<void> clear() async {
    await _prefs?.clear();
  }
}
