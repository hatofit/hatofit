// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActiveThemeAdapter extends TypeAdapter<ActiveTheme> {
  @override
  final int typeId = 13;

  @override
  ActiveTheme read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ActiveTheme.light;
      case 1:
        return ActiveTheme.dark;
      case 2:
        return ActiveTheme.system;
      default:
        return ActiveTheme.light;
    }
  }

  @override
  void write(BinaryWriter writer, ActiveTheme obj) {
    switch (obj) {
      case ActiveTheme.light:
        writer.writeByte(0);
        break;
      case ActiveTheme.dark:
        writer.writeByte(1);
        break;
      case ActiveTheme.system:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActiveThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
