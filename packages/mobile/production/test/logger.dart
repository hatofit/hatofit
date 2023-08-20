import 'package:logger/logger.dart';

final testlogger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 65,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);
