import 'package:calendar_view/calendar_view.dart';
import 'package:ringo_media/common/rm_app_bar_widget.dart';
import 'package:ringo_media/features/calendar_feature/domain/cubit/calendar_day_cubit.dart';
import 'package:ringo_media/features/calendar_feature/domain/cubit/choose_date_cubit.dart';
import 'package:ringo_media/features/calendar_feature/views/calendar_screen/components/calendar_list_task_widgt.dart';
import 'package:ringo_media/features/calendar_feature/views/calendar_screen/components/calendar_month_widget.dart';
import 'package:ringo_media/features/calendar_feature/views/calendar_screen/components/calendar_schedule_widget.dart';
import 'package:ringo_media/features/calendar_feature/views/calendar_screen/components/calendar_tabs_button_widget.dart';
import 'package:ringo_media/file_export.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});
  static const routeName = "/CalendarScreen";

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CalendarDayCubit>().addEvents();
    context.read<ChooseDateCubit>().getDays();
  }

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: Scaffold(
        backgroundColor: AppColors.neutralColors200,
        appBar: RMAppBarWidget(
          centerTitle: false,
          titleWidget: Text(
            "Calendar",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontVariations: [const FontVariation.weight(700)],
            ),
          ),
          toolbarHeight: 70.h,
          bottom: Divider(
            height: 10,
            thickness: 1.5,
            color: AppColors.neutralColors400.withOpacity(.3),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CalendarMonthWidget(),
              const SizedBox(
                height: RMDimensions.xLarge,
              ),
              const CalendarTabsButtonWidget(),
              if (context.watch<CalendarDayCubit>().isScheduled)
                const ScheduleWidget()
              else
                const CalendarListTaskWidget()
            ],
          ),
        ),
      ),
    );
  }
}
