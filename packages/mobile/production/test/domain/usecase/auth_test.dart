import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatofit/app/core/domain/failure.dart';
import 'package:hatofit/app/core/domain/success.dart';
import 'package:hatofit/data/models/user.dart';
import 'package:hatofit/data/repos/auth_repo_iml.dart';
import 'package:hatofit/domain/usecases/api/auth/login_uc.dart';
import 'package:hatofit/domain/usecases/api/auth/register_uc.dart';
import '../../logger.dart';

void main() {
  group('Authetication Test', () {
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
    test('login with right parameter', () async {
      final authRepoAbs = AuthRepoIml();
      final loginUC = LoginUC(authRepoAbs);
      const param = Tuple2('dayat@gmail.com', 'password');
      final result = await loginUC.execute(param);

      result.fold(
        (f) {},
        (s) {
          testlogger.d('+++ Login Success with right parameter +++\n'
              'Parameter: \n'
              'Email: ${param.value1}\n'
              'Password: ${param.value2}\n'
              'Type: ${s.runtimeType}\n'
              'Success Data: ${s.data}');
          expect(s, isA<Success>());
        },
      );
    });

    test('login with wrong parameter', () async {
      final authRepoAbs = AuthRepoIml();
      final loginUC = LoginUC(authRepoAbs);
      const param = Tuple2('random@user.com', 'notpassword');
      final result = await loginUC.execute(param);
      result.fold(
        (f) {
          testlogger.e('+++ Login Failure with wrong parameter +++\n'
              'Parameter \n'
              'Email: ${param.value1}\n'
              'Password: ${param.value2}\n'
              'Type: ${f.runtimeType}\n'
              'Failure Details: ${f.details}');

          expect(f, isA<Failure>());
        },
        (s) {},
      );
    });

    test('register with right parameter', () async {
      final authRepoAbs = AuthRepoIml();
      final registerUC = RegisterUC(authRepoAbs);
      final param = User(
        firstName: 'Dayat',
        lastName: 'Rifaldi',
        email: 'drfld@gmail.com',
        password: 'password',
        confirmPassword: 'password',
        dateOfBirth: DateTime.now(),
        gender: 'male',
        photo: '',
        height: 170,
        weight: 60,
        metricUnits: MetricsUnits(
          energyUnits: EnergyUnits.kCal,
          heightUnits: HeightUnits.cm,
          weightUnits: WeightUnits.kg,
        ),
      );
      final result = await registerUC.execute(param);
      result.fold((l) {}, (r) {
        testlogger.d('+++ Register Success with right parameter +++\n'
            'Parameter \n'
            'First Name: ${param.firstName}\n'
            'Last Name: ${param.lastName}\n'
            'Email: ${param.email}\n'
            'Password: ${param.password}\n'
            'Type: ${r.runtimeType}\n'
            'Success Data: ${r.data}');
        expect(r, isA<Success>());
      });
    });

    test('register with wrong parameter', () async {
      final authRepoAbs = AuthRepoIml();
      final registerUC = RegisterUC(authRepoAbs);
      final param = User(
        firstName: 'Dayat',
        lastName: 'Rifaldi',
        email: 'drfld#gmail.com',
        password: 'password',
      );
      final result = await registerUC.execute(param);
      result.fold(
        (l) {
          testlogger.e('+++ Register Failure with wrong parameter +++\n'
              'Parameter \n'
              'First Name: ${param.firstName}\n'
              'Last Name: ${param.lastName}\n'
              'Email: ${param.email}\n'
              'Password: ${param.password}\n'
              'Type: ${l.runtimeType}\n'
              'Failure Details: ${l.details}');
          expect(l, isA<Failure>());
        },
        (r) {},
      );
    });
  });
}
