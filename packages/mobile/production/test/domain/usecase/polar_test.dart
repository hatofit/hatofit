import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:polar/polar.dart';

import '../../logger.dart';

class MockPolar extends Mock implements Polar {}

void main() {
  group('Polar', () {
    late Polar polar;
    DateTime? startTime;
    DateTime? endTime;
    setUp(() {
      startTime = DateTime.now();
      polar = MockPolar();
    });

    tearDown(() {
      endTime = DateTime.now();
      testLogger.i(
          'Test Duration: ${endTime!.difference(startTime!).inMilliseconds} ms');
    });

    test('initialize polar adapter', () {
      expect(polar, isA<Polar>());
    });

    test('connect device', () async {
      when(() => polar.connectToDevice('C16E3B2F')).thenAnswer((_) async {});
      await polar.connectToDevice('C16E3B2F');
      verify(() => polar.connectToDevice('C16E3B2F')).called(1);
    });
  });
}
