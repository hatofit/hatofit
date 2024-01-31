import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final log = kDebugMode ? Logger(printer: PrettyPrinter(methodCount: 0)) : null;

void jsonPrettyPrint(dynamic json) {
  if (log != null) {
    log?.d(_formatJson(json));
  }
}

String _formatJson(dynamic json) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final String prettyJson = encoder.convert(json);
  return prettyJson;
}
