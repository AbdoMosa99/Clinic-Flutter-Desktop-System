class TimeStamp {
  DateTime dateTime;

  TimeStamp(this.dateTime);

  final weekDays = [
    "الإثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
    "الجمعة",
    "السبت",
    "الأحد",
  ];

  String hour() {
    int hour = dateTime.hour;
    String period = "صباحاً";
    if (hour >= 12) {
      if (hour != 12) {
        hour -= 12;
      }
      period = "مساءاً";
    }
    return "$period $hour:${dateTime.minute}";
  }

  String date() {
    return "${dateTime.year}/${dateTime.month}/${dateTime.day}";
  }

  String weekDay() {
    return weekDays[dateTime.weekday - 1];
  }

  @override
  String toString() {
    return dateTime.toString();
  }

  factory TimeStamp.fromString(String s) {
    return TimeStamp(DateTime.parse(s));
  }
}
