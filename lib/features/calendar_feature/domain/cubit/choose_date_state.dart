part of 'choose_date_cubit.dart';

@immutable
sealed class ChooseDateState {}

final class ChooseDateInitial extends ChooseDateState {}

final class ChooseDateUpdateSelectedDay extends ChooseDateState {}

final class ChooseDateUpdatePreviousMonth extends ChooseDateState {}

final class ChooseDateUpdateNextMonth extends ChooseDateState {}
