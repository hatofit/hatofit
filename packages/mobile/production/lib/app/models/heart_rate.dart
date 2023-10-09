class HrStats {
  final int avg;
  final int max;
  final int min;
  final int last;
  final String time;
  final List<HrChart> sfSpot; 


  HrStats({
    required this.avg,
    required this.max,
    required this.min,
    required this.last,
    required this.time,
    required this.sfSpot, 
  });
}

class HrChart {
  final DateTime time;
  final double hr;

  HrChart(this.time, this.hr);
}
