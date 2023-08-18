class DateUtils {
  static DateTime formatDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return parsedDate;
  }

  static String monthToWord(String datetime) {
    final date = DateTime.parse(datetime);
    final numToMonth = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'July',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec'
    };
    final formattedDate = "${date.day} ${numToMonth[date.month]} ${date.year}";
    return formattedDate;
  }
}
