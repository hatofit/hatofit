import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'active_theme.g.dart';

@HiveType(
  typeId: BoxTypeId.activeThemeIndex,
  adapterName: BoxTypeId.activeThemeAdapterName,
)
enum ActiveTheme {
  @HiveField(0)
  light(ThemeMode.light),
  @HiveField(1)
  dark(ThemeMode.dark),
  @HiveField(2)
  system(ThemeMode.system);

  final ThemeMode mode;

  const ActiveTheme(this.mode);
}

void regisTheme() {
  if (!Hive.isAdapterRegistered(BoxTypeId.activeThemeIndex)) {
    Hive.registerAdapter(ActiveThemeAdapter());
  }
}
