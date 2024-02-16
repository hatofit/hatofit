extension DateTimeExt on DateTime {
  int toMilis(int epoch) {
    final millis = microsecondsSinceEpoch - epoch;
    return millis * 1000;
  }
}
