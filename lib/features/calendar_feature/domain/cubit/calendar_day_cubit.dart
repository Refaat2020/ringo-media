import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';
import 'package:ringo_media/file_export.dart';

part 'calendar_day_state.dart';

class CalendarDayCubit extends Cubit<CalendarDayState> {
  CalendarDayCubit() : super(CalendarDayInitial());
  bool isScheduled = true;
  EventController eventController = EventController();
  List<CalendarEventData> events = [
    CalendarEventData(
      date: DateTime.now(),
      title: "Project meeting",
      description: "Today is project meeting.",
      color: AppColors.additionalPurple,
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 1),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 3, 30),
    ),
    CalendarEventData(
      date: DateTime.now(),
      color: AppColors.additionalBlue,
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 5),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 30),
      title: "Wedding anniversary",
      description: "Attend uncle's wedding anniversary.",
    ),
  ];

  void addEvents() {
    eventController.addAll(events);
    emit(CalendarDayAddEvents());
  }

  void changeTap(bool selectedTap) {
    isScheduled = selectedTap;
    emit(CalendarDayChangeTap());
  }

  String formatTimeRange(DateTime startTime, DateTime endTime) {
    final DateFormat formatter = DateFormat('hh:mm a');
    String start = formatter.format(startTime);
    String end = formatter.format(endTime);
    return '$start - $end';
  }
}
