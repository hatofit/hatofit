import 'dart:convert';

import 'package:logger/logger.dart';

final log = Logger(printer: PrettyPrinter(methodCount: 0));

void jsonPrettyPrint(dynamic json) {
  log.d(_formatJson(json));
}

String _formatJson(dynamic json) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final String prettyJson = encoder.convert(json);
  return prettyJson;
}
