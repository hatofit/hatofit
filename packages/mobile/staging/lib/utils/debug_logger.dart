import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 65,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);
