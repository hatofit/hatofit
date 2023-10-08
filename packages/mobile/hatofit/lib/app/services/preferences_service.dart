import 'dart:convert';

import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  user,
  token,
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

  Future<void> clear() async {
    await _prefs?.clear();
  }
}
