import 'package:get/get.dart';
import 'package:hatofit/app/models/charts/hr_widget.dart';
import 'package:hatofit/app/models/report_model.dart';
import 'package:hatofit/app/modules/dashboard/views/history/history_controller.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/utils/calories_utils.dart';
import 'package:hatofit/utils/hr_zone.dart';
// import 'package:health/health.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  late final String formattedDate =
      DateFormat('d MMMM yyyy').format(DateTime.now());

  final history = Get.find<HistoryController>();
  final store = Get.find<PreferencesService>();
  final prov = Get.find<InternetService>();
  final hrZone = HrZoneutils();
  final historyList = <dynamic>[].obs;
  final report = <ReportModel>[].obs;
  final hrData = <HrWidgetChart>[].obs;
  int hrPercentage = 0;
  final calorUtils = CaloriesUtils();
  final age = 0.obs;
  final gender = ''.obs;
  final weight = 0.obs;
  final height = 0.obs;
  final weightUnits = ''.obs;
  final heightUnits = ''.obs;
  final energyUnits = ''.obs;
  @override
  void onInit() async {
    hrCharting();
    if (store.user != null) {
      age.value = DateTime.now().year - store.user!.dateOfBirth!.year;
      gender.value = store.user!.gender!;
      weight.value = store.user!.weight!;
      height.value = store.user!.height!;
      weightUnits.value = store.user!.metricUnits!.weightUnits!;
      heightUnits.value = store.user!.metricUnits!.heightUnits!;
      energyUnits.value = store.user!.metricUnits!.energyUnits!;
    }
    // if (store.isSyncGoogleFit ?? false) {
    //   await fetchData();
    // }

    super.onInit();
  }

  double calories = 0;
  String? lastExercise;

  Future<void> hrCharting() async {
    hrData.clear();
    report.clear();
    calories = 0;
    historyList.assignAll(await history.fetchHistory());
    if (historyList.isEmpty) {
      return;
    }
    final lastExerciseTime =
        DateTime.fromMicrosecondsSinceEpoch(historyList.last['endTime']);
    final formatter = DateFormat('d MMMM yyyy');
    lastExercise = formatter.format(lastExerciseTime);

    for (var item in historyList) {
      final r = await prov.fetchReport(item['_id']);
      report.add(
        ReportModel.fromJson(r['report']),
      );
    }
    for (var item in report) {
      final endTimeMicros = item.endTime;
      final dateEnd = DateTime.fromMicrosecondsSinceEpoch(endTimeMicros);
      if (item.reports.any((element) => element.type.contains('hr'))) {
        final hrValue = item.reports
            .firstWhere((element) => element.type == 'hr')
            .data
            .first
            .value;
        final avg = hrValue.map((entry) => entry[1]).reduce((a, b) => a + b) /
            hrValue.length;
        final date1 = formatter.format(dateEnd);
        final date2 = formatter.format(DateTime.now());

        if (date1 == date2) {
          final duration = dateEnd
              .difference(DateTime.fromMicrosecondsSinceEpoch(item.startTime));
          calories += calorUtils.findCalories(
            duration,
            avg,
            age.value,
            gender.value,
            weight.value,
            weightUnits.value,
            energyUnits.value,
          );
        }

        hrData.add(HrWidgetChart(dateEnd, avg));
      }
    }

    report.clear();
    if (hrData.length > 5) {
      hrData.removeRange(0, hrData.length - 5);
    }

    update();
  }

  double userBMI() {
    final height = store.user!.height!;
    final weight = store.user!.weight!;
    final metricUnits = store.user!.metricUnits!;

    double? bmi;

    switch (metricUnits.weightUnits) {
      case 'kg':
        switch (metricUnits.heightUnits) {
          case 'cm':
            bmi = weight / ((height / 100) * (height / 100));
            break;
          case 'ft':
            bmi = weight / ((height * 12) * (height * 12)) * 703;
            break;
        }
        break;

      case 'lbs':
        switch (metricUnits.heightUnits) {
          case 'cm':
            bmi = weight / ((height / 100) * (height / 100)) * 703;
            break;
          case 'ft':
            bmi = weight / ((height * 12) * (height * 12));
            break;
        }
        break;
    }

    return double.parse(bmi!.toStringAsFixed(1));
  }

  String bmiStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Normal';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'Overweight';
    } else if (bmi >= 30 && bmi <= 34.9) {
      return 'Obesity';
    } else {
      return 'Unknown';
    }
  }

  findPercent(int hr) {
    hrPercentage = hrZone.findPercentage(hr);
  }

  // static final types = [
  //   HealthDataType.HEART_RATE,
  //   HealthDataType.WEIGHT,
  //   HealthDataType.HEIGHT,
  //   HealthDataType.STEPS,
  //   HealthDataType.SLEEP_ASLEEP,
  // ];
  // final healthDataList = <HealthDataPoint>[].obs;
  // final stepsMapping = <HealthDataPoint>[].obs;
  // final sleepMapping = <HealthDataPoint>[].obs;
  // final sleepPointerGauge = 0.0.obs;
  // HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  // Future fetchData() async {
  //   final now = DateTime.now();
  //   final yesterday = now.subtract(const Duration(hours: 24));
  //   healthDataList.clear();
  //   stepsMapping.clear();

  //   try {
  //     List<HealthDataPoint> healthData =
  //         await health.getHealthDataFromTypes(yesterday, now, types);
  //     healthDataList.addAll(
  //         (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
  //   } catch (error) {
  //     MySnackbar.error(
  //         'Error', 'Error while trying to fetch data from Google Fit');
  //   }
  //   healthDataList.value = HealthFactory.removeDuplicates(healthDataList);
  //   for (var item in healthDataList) {
  //     if (item.type == HealthDataType.STEPS
  //         //  &&
  //         //     item.dateTo == DateTime.now() &&
  //         //     item.dateFrom == DateTime.now().subtract(Duration(days: 1))
  //         ) {
  //       stepsMapping.add(item);
  //     }
  //     if (item.type == HealthDataType.SLEEP_ASLEEP
  //         // &&
  //         //     item.dateTo == DateTime.now() &&
  //         //     item.dateFrom == DateTime.now().subtract(Duration(days: 1)),
  //         ) {
  //       sleepMapping.add(item);
  //       final totalSleepHours = double.parse(item.value.toString()) / 60;
  //       if (totalSleepHours < 7) {
  //         sleepPointerGauge.value = 33;
  //       } else if (totalSleepHours >= 7 && totalSleepHours <= 9) {
  //         sleepPointerGauge.value = 50;
  //       } else if (totalSleepHours > 9) {
  //         sleepPointerGauge.value = 100;
  //       }
  //     }
  //   }
  // }
}
