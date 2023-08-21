import 'package:flutter_test/flutter_test.dart';
import 'package:hatofit/app/core/domain/failure.dart';
import 'package:hatofit/app/core/domain/success.dart';
import 'package:hatofit/data/repos/report_repo_iml.dart';
import 'package:hatofit/domain/usecases/api/report/fetch_report_api_uc.dart';

import '../../logger.dart';

void main() {
  group('Report', () {
    DateTime? startTime;
    DateTime? endTime;
    setUp(() {
      startTime = DateTime.now();
    });

    tearDown(() {
      endTime = DateTime.now();
      testlogger.i(
          'Test Duration: ${endTime!.difference(startTime!).inMilliseconds} ms');
    });

    test('fetch with right parameter', () async {
      final reportRepoAbs = ReportRepoIml();
      final reportUC = FetchReportApiUC(reportRepoAbs);
      const param = '64dea10fc200d43176521903';
      final result = await reportUC.execute(param);
      result.fold(
        (f) {},
        (s) {
          testlogger.d('+++ Fetch Report Success with right parameter +++\n'
              'Parameter: \n'
              'Report Id: $param\n'
              'Type: ${s.runtimeType}\n'
              'Success Data: ${s.data}');
          expect(s, isA<Success>());
        },
      );
    });

    test('fetch with wrong parameter', () async {
      final reportRepoAbs = ReportRepoIml();
      final reportUC = FetchReportApiUC(reportRepoAbs);
      const param = 'wrongid';
      final result = await reportUC.execute(param);
      result.fold(
        (f) {
          testlogger.e('+++ Fetch Report Failure with wrong parameter +++\n'
              'Parameter \n'
              'Report Id: $param\n'
              'Type: ${f.runtimeType}\n'
              'Failure Details: ${f.details}');
          expect(f, isA<Failure>());
        },
        (s) {},
      );
    });
  });
}
