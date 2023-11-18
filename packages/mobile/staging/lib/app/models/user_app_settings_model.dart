import 'package:json_annotation/json_annotation.dart';

part 'user_app_settings_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserAppSettingsModel {
  bool? linkGoogleFit;
  bool? developerMode;
  bool? isDarkMode;

  UserAppSettingsModel({
    this.linkGoogleFit,
    this.developerMode,
    this.isDarkMode,
  });

  factory UserAppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$UserAppSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserAppSettingsModelToJson(this);
}
