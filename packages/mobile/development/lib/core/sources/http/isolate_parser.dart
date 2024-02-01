import 'dart:isolate';

import 'package:hatofit/core/core.dart';

class JSONIsolateParser<T> {
  final Map<String, dynamic> json;

  ResponseConverter<T> converter;

  JSONIsolateParser(this.json, this.converter);

  Future<T> parseInBackground() async {
    final port = ReceivePort();
    await Isolate.spawn(_parseListOfJson, port.sendPort);

    final result = await port.first;
    return result as T;
  }

  Future<void> _parseListOfJson(SendPort sendPort) async {
    final result = converter(json);
    Isolate.exit(sendPort, result);
  }
}

typedef ModelToEntityConverter<T> = T Function(dynamic response);

class ModelToEntityIsolateParser<T> {
  final dynamic model;

  ModelToEntityConverter<T> converter;

  ModelToEntityIsolateParser(this.model, this.converter);

  Future<T> parseInBackground() async {
    final port = ReceivePort();
    await Isolate.spawn(_parseListOfModel, port.sendPort);

    final result = await port.first;
    return result as T;
  }

  Future<void> _parseListOfModel(SendPort sendPort) async {
    final result = converter(model);
    Isolate.exit(sendPort, result);
  }
}
