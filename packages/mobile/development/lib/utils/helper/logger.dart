import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final log = kDebugMode ? Logger(printer: PrettyPrinter(methodCount: 0)) : null;
