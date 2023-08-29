import 'package:flutter_test/flutter_test.dart';
import 'package:get/instance_manager.dart';
import 'package:hatofit/app/services/internet_provider.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/utils/debug_logger.dart';

import 'test_logger.dart';

void main() {
  group('Exercises', () {
    DateTime? startTime;
    DateTime? endTime;

    setUpAll(() async {
      Get.put(PreferencesService());
      startTime = DateTime.now();
    });

    tearDownAll(() async {
      endTime = DateTime.now();
      testLogger.i(
          'Test Duration: ${endTime!.difference(startTime!).inMilliseconds} ms');
    });

    test('[GET] list exercise test', () async {
      final res = await InternetProvider().getExercises();
      logger.i(res!.map((e) => e.name));
    });
  });
}
