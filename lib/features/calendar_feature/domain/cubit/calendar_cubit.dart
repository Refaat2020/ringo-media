import 'package:ringo_media/file_export.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial());

  DateTime selectedDate = DateTime.now();

  void prevMonth() {
    selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
    emit(CalendarPreviousMonth());
  }

  void nextMonth() {
    selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
    emit(CalendarNextMonth());
  }

  void selectDay(int day) {
    selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
    emit(CalendarUpdateSelectedDay());
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "";
    }
  }

  String getDayOfWeek(int day) {
    switch (DateTime(selectedDate.year, selectedDate.month, day).weekday) {
      case DateTime.monday:
        return "MON";
      case DateTime.tuesday:
        return "TUE";
      case DateTime.wednesday:
        return "WED";
      case DateTime.thursday:
        return "THU";
      case DateTime.friday:
        return "FRI";
      case DateTime.saturday:
        return "SAT";
      case DateTime.sunday:
        return "SUN";
      default:
        return "";
    }
  }

  String get monthName =>
      "${getMonthName(selectedDate.month)} ${selectedDate.year} ";
}
