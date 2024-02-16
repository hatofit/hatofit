
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

part 'data_helper.freezed.dart';

enum CubitStatus { initial, loading, success, failure }

@unfreezed
class DataHelper with _$DataHelper {
  factory DataHelper({
    String? title,
    String? desc,
    String? iconPath,
    IconData? icon,
    String? url,
    String? type,
    int? id,
    Color? color,
    UserEntity? user,
    DataHelper? sLang,
    DataHelper? sEUnit,
    DataHelper? sHUnit,
    DataHelper? sWUnit,
    @Default(false) bool isGoogleFitAvailable,
    @Default(false) bool isSelected,
    @Default(ActiveTheme.light) ActiveTheme activeTheme,
  }) = _DataHelper;
}
