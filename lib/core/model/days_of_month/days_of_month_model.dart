import 'package:parking_lot/core/model/days_of_month/days_of_month_entity.dart';

class DaysOfMonthModel extends DaysOfMonthEntity {
  DaysOfMonthModel({
    required String day,
    required String abrevDay,
    required String month,
    required String abrevMonth,
    required String year,
    required DateTime date,
    required bool isSelected,
  }) : super(
          day: day,
          abrevDay: abrevDay,
          month: month,
          abrevMonth: abrevMonth,
          year: year,
          date: date,
          isSelected: isSelected,
        );

  static DaysOfMonthModel init() {
    return DaysOfMonthModel(
      day: '',
      abrevDay: '',
      month: '',
      abrevMonth: '',
      year: '',
      date: DateTime.now(),
      isSelected: false,
    );
  }

  factory DaysOfMonthModel.fromJson(Map<String, dynamic>? json) {
    return DaysOfMonthModel(
      day: json?['day'] ?? '',
      abrevDay: json?['abrevDay'] ?? '',
      month: json?['month'] ?? '',
      abrevMonth: json?['abrevMonth'] ?? '',
      year: json?['year'] ?? '',
      date: json?['date'] ?? DateTime.now(),
      isSelected: json?['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'abrevDay': abrevDay,
      'month': month,
      'abrevMonth': abrevMonth,
      'year': year,
      'date': date,
      'isSelected': isSelected,
    };
  }
}
