part of 'calendar_cubit.dart';

@immutable
sealed class CalendarState {}

final class CalendarInitial extends CalendarState {}

final class CalendarNextMonth extends CalendarState {}

final class CalendarPreviousMonth extends CalendarState {}

final class CalendarUpdateSelectedDay extends CalendarState {}
