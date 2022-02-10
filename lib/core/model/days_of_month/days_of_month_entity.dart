abstract class DaysOfMonthEntity {
  String day;
  String abrevDay;
  String month;
  String abrevMonth;
  String year;
  DateTime date;
  bool isSelected;

  DaysOfMonthEntity({
    required this.day,
    required this.abrevDay,
    required this.month,
    required this.abrevMonth,
    required this.year,
    required this.date,
    required this.isSelected,
  });
}
