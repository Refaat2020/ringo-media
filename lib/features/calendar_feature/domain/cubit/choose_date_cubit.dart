import 'package:ringo_media/file_export.dart';

part 'choose_date_state.dart';

class ChooseDateCubit extends Cubit<ChooseDateState> {
  ChooseDateCubit() : super(ChooseDateInitial());
  List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();
  List<int> listOfDays = [];

  void onDaySelected(int day) {
    selectedDate = DateTime(focusedDate.year, focusedDate.month, day);
    emit(ChooseDateUpdateSelectedDay());
  }

  void getPreviousMonth() {
    focusedDate = DateTime(focusedDate.year, focusedDate.month - 1);
    emit(ChooseDateUpdatePreviousMonth());
  }

  void getNextMonth() {
    focusedDate = DateTime(focusedDate.year, focusedDate.month + 1);
    emit(ChooseDateUpdateNextMonth());
  }

  void getDays() {
    int daysInMonth =
        DateUtils.getDaysInMonth(focusedDate.year, focusedDate.month);
    for (int i = 0; i < daysInMonth; i++) {
      DateTime day = DateTime(focusedDate.year, focusedDate.month, i + 1);
      listOfDays.add(day.day);
    }
  }

  bool Function(int) get selectedDay => (i) =>
      selectedDate.day == listOfDays[i] &&
      selectedDate.month == focusedDate.month &&
      selectedDate.year == focusedDate.year;
}
