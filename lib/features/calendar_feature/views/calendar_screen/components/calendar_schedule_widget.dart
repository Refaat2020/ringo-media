import 'package:calendar_view/calendar_view.dart';
import 'package:ringo_media/features/calendar_feature/data/models/task_model.dart';
import 'package:ringo_media/features/calendar_feature/domain/cubit/calendar_day_cubit.dart';
import 'package:ringo_media/features/calendar_feature/views/calendar_screen/components/calendar_task_widget.dart';
import 'package:ringo_media/file_export.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarDayCubit = context.watch<CalendarDayCubit>();

    return SizedBox(
      height: ScreenUtil().screenHeight / 1.5,
      child: DayView(
        showVerticalLine: false,
        controller: calendarDayCubit.eventController,
        headerStyle: const HeaderStyle(
          decoration: BoxDecoration(color: Colors.transparent),
          leftIconVisible: false,
          rightIconVisible: false,
          headerTextStyle: TextStyle(fontSize: 0),
        ),
        eventTileBuilder: (date, events, boundary, startDuration, endDuration) {
          final event = events.first;
          return Padding(
            padding: const EdgeInsets.all(RMDimensions.small2),
            child: TaskWidget(
              task: Task(
                title: event.title,
                time: calendarDayCubit.formatTimeRange(
                    startDuration, endDuration),
                color: event.color.withOpacity(.4),
                borderColor: event.color,
              ),
            ),
          );
        },
      ),
    );
  }
}
