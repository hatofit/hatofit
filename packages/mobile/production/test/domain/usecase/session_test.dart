import 'package:flutter_test/flutter_test.dart';
import 'package:hatofit/app/core/domain/failure.dart';
import 'package:hatofit/app/core/domain/success.dart';
import 'package:hatofit/data/repos/session_repo_iml.dart';
import 'package:hatofit/domain/usecases/api/sesion/fetch_session_api_uc.dart';

import '../../logger.dart';

void main() {
  group('Session Test', () {
    DateTime? startTime;
    DateTime? endTime;

    setUp(() {
      startTime = DateTime.now();
    });

    tearDown(() {
      endTime = DateTime.now();
      testLogger.i(
          'Test Duration: ${endTime!.difference(startTime!).inMilliseconds} ms');
    });

    test('fetch [API] with right token', () async {
      final sessionRepoAbs = SessionRepoIml();
      final sessionUC = FetchSessionApiUC(sessionRepoAbs);
      const param =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZGNkNGYyMWI2MmNhZTM1MDdjZWM1YyIsImlhdCI6MTY5MjU2NDQ3NSwiZXhwIjoxNjkyNjUwODc1fQ.XxDgzrVcmoxYPZUEkqgIm0YK23j3CzCAORQWFG4oqBk';
      final result = await sessionUC.execute(param);
      result.fold(
        (f) {},
        (s) {
          testLogger.d('+++ Fetch Session Success with right parameter +++\n'
              'Parameter: \n'
              'Token: $param\n'
              'Type: ${s.runtimeType}\n'
              'Success Data: ${s.data}');
          expect(s, isA<Success>());
        },
      );
    });

    test('fetch [API] with wrong token', () async {
      final sessionRepoAbs = SessionRepoIml();
      final sessionUC = FetchSessionApiUC(sessionRepoAbs);
      const param = 'wrongtoken';
      final result = await sessionUC.execute(param);
      result.fold(
        (f) {
          testLogger.e('+++ Fetch Session Failure with wrong parameter +++\n'
              'Parameter \n'
              'Token: $param\n'
              'Type: ${f.runtimeType}\n'
              'Failure Details: ${f.details}');
          expect(f, isA<Failure>());
        },
        (s) {},
      );
    });
  });
}
