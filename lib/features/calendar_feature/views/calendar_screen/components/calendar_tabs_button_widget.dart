import 'package:ringo_media/features/calendar_feature/domain/cubit/calendar_day_cubit.dart';
import 'package:ringo_media/file_export.dart';

class CalendarTabsButtonWidget extends StatelessWidget {
  const CalendarTabsButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarDayCubit = context.watch<CalendarDayCubit>();
    return Padding(
      padding: const EdgeInsets.all(RMDimensions.xLarge),
      child: Row(
        children: [
          Column(
            children: [
              TextButton(
                onPressed: () => calendarDayCubit.changeTap(true),
                child: Text(
                  "Schedule",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: calendarDayCubit.isScheduled
                        ? AppColors.neutralColors900
                        : AppColors.neutralColors500,
                    fontVariations: [
                      const FontVariation.weight(700),
                    ],
                  ),
                ),
              ),
              if (calendarDayCubit.isScheduled) ...[
                const SizedBox(
                  height: RMDimensions.medium,
                ),
                Container(
                  height: 2,
                  color: AppColors.neutralColors900,
                  width: ScreenUtil().screenWidth / 3,
                ),
              ]
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          Column(
            children: [
              TextButton(
                onPressed: () => calendarDayCubit.changeTap(false),
                child: Text(
                  "Task",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: !calendarDayCubit.isScheduled
                        ? AppColors.neutralColors900
                        : AppColors.neutralColors500,
                    fontVariations: [
                      const FontVariation.weight(700),
                    ],
                  ),
                ),
              ),
              if (!calendarDayCubit.isScheduled) ...[
                const SizedBox(
                  height: RMDimensions.medium,
                ),
                Container(
                  height: 2,
                  color: AppColors.neutralColors900,
                  width: ScreenUtil().screenWidth / 3,
                ),
              ]
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
