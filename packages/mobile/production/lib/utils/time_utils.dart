class TimeUtils {
  static String elapsed(int f, int e) {
    final DateTime startTime = DateTime.fromMicrosecondsSinceEpoch(f);
    final DateTime endTime = DateTime.fromMicrosecondsSinceEpoch(e);
    final Duration elapsed = endTime.difference(startTime);
    return elapsed.toString().split('.')[0];
  }
}
