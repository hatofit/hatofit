import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hatofit/config/constant.dart';

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
  (ref) => DarkModeNotifier(),
);
final ThemeData lightTheme = ThemeData.light().copyWith(
  useMaterial3: true,
  primaryColor: kRedColor,
);
final ThemeData darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  primaryColor: kRedColor,
);
