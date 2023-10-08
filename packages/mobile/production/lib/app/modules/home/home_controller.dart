import 'package:get/get.dart';
import 'package:hatofit/app/models/report_model.dart';
import 'package:hatofit/app/modules/history/history_controller.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  late final String formattedDate =
      DateFormat('d MMMM yyyy').format(DateTime.now());

  final history = Get.find<HistoryController>();
  final store = Get.find<PreferencesService>();
  final prov = Get.find<InternetService>();

  final historyList = <dynamic>[].obs;
  final report = <ReportModel>[].obs;

  final hrData = <HrWidgetChart>[].obs;

  @override
  void onInit() async {
    hrCharting();
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
          calories += findCalories(duration, avg);
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

  double findCalories(Duration duration, double avgHr) {
    final dob = store.user!.dateOfBirth!;
    final now = DateTime.now();
    final age = now.year - dob.year;
    final gender = store.user!.gender!;
    final weight = store.user!.weight!;
    final weightUnits = store.user!.metricUnits!.weightUnits;
    final energyUnits = store.user!.metricUnits!.energyUnits;
    final secToMin = duration.inSeconds / 60;
    double calories = 0;

    switch (gender) {
      case 'male':
        if (weightUnits == 'kg') {
          calories = secToMin *
              (0.6309 * avgHr + 0.1988 * weight + 0.2017 * age - 55.0969) /
              4.184;
        } else if (weightUnits == 'lbs') {
          final weightInKg = weight * 0.453592;
          calories = secToMin *
              (0.6309 * avgHr + 0.1988 * weightInKg + 0.2017 * age - 55.0969) /
              4.184;
        }
        break;

      case 'female':
        if (weightUnits == 'kg') {
          calories = secToMin *
              (0.4472 * avgHr - 0.1263 * weight + 0.074 * age - 20.4022) /
              4.184;
        } else if (weightUnits == 'lbs') {
          final weightInKg = weight * 0.453592;
          calories = secToMin *
              (0.4472 * avgHr - 0.1263 * weightInKg + 0.074 * age - 20.4022) /
              4.184;
        }
        break;

      default:
        calories = 0;
        break;
    }
    if (energyUnits == 'kcal') {
      return calories;
    } else if (energyUnits == 'kJ') {
      return calories * 4.184;
    }

    return calories;
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
}

class HrWidgetChart {
  final DateTime date;
  final double avgHr;
  HrWidgetChart(this.date, this.avgHr);
}
