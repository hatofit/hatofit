// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_app_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAppSettingsModel _$UserAppSettingsModelFromJson(
        Map<String, dynamic> json) =>
    UserAppSettingsModel(
      linkGoogleFit: json['linkGoogleFit'] as bool?,
      developerMode: json['developerMode'] as bool?,
      isDarkMode: json['isDarkMode'] as bool?,
    );

Map<String, dynamic> _$UserAppSettingsModelToJson(
        UserAppSettingsModel instance) =>
    <String, dynamic>{
      'linkGoogleFit': instance.linkGoogleFit,
      'developerMode': instance.developerMode,
      'isDarkMode': instance.isDarkMode,
    };
