part of 'calendar_day_cubit.dart';

@immutable
sealed class CalendarDayState {}

final class CalendarDayInitial extends CalendarDayState {}

final class CalendarDayAddEvents extends CalendarDayState {}

final class CalendarDayChangeTap extends CalendarDayState {}
