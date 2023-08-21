import 'dart:io';

import 'package:hatofit/data/sources/api/base/api_path.dart';
import 'package:hatofit/data/sources/api/base/api_payload_repo_abs.dart';
import 'package:hatofit/data/sources/api/base/api_source.dart';

class ReportApiRepoIml implements ApiPayloadRepoAbs {
  // final String token;
  final String id;
  ReportApiRepoIml._({
    // required this.token,
    required this.id,
  });

  factory ReportApiRepoIml.fetch({
    required String id,
  }) =>
      ReportApiRepoIml._(
        id: id,
      );

  @override
  get body => null;

  @override
  Map<String, String>? get headers => {
        HttpHeaders.contentTypeHeader: 'application/json',
        // 'Authorization': 'Bearer $token',
      };
  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String get path => ApiPath.report;

  @override
  String get url => ApiPath.baseUri + path + id;

  @override
  Future request() async => await ApiSource.instance.request(this);
}
