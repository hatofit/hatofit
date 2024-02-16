import 'dart:isolate';

import 'package:hatofit/core/core.dart';

class JSONIParser<T> {
  final Map<String, dynamic> json;

  JSONIConv<T> converter;

  JSONIParser(this.json, this.converter);

  Future<T> parseInBackground() async {
    final port = ReceivePort();
    await Isolate.spawn(_parseJson, port.sendPort);

    final result = await port.first;
    return result as T;
  }

  Future<void> _parseJson(SendPort sendPort) async {
    final result = converter(json);
    Isolate.exit(sendPort, result);
  }
}

typedef IConv<T> = T Function(dynamic response);

class IParser<T> {
  final dynamic model;

  IConv<T> converter;

  IParser(this.model, this.converter);

  Future<T> parseInBackground() async {
    final port = ReceivePort();
    await Isolate.spawn(_parser, port.sendPort);

    final result = await port.first;
    return result as T;
  }

  Future<void> _parser(SendPort sendPort) async {
    final result = converter(model);
    Isolate.exit(sendPort, result);
  }
}
