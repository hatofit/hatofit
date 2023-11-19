class CaloriesUtils {
  double findCalories(
    Duration duration,
    double avgHr,
    int age,
    String gender,
    int weight,
    String weightUnits,
    String energyUnits,
  ) {
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
}
