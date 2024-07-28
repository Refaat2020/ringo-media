import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ringo_media/common/rm_shadow.dart';
import 'package:ringo_media/features/calendar_feature/domain/cubit/calendar_cubit.dart';
import 'package:ringo_media/features/calendar_feature/domain/cubit/choose_date_cubit.dart';
import 'package:ringo_media/features/calendar_feature/views/choose_date_screen/choose_date_screen.dart';
import 'package:ringo_media/file_export.dart';

class CalendarMonthWidget extends StatelessWidget {
  const CalendarMonthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarCubit = context.watch<CalendarCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(RMDimensions.xLarge),
          child: Row(
            children: [
              Text(
                calendarCubit.monthName,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontVariations: [
                    const FontVariation.weight(700),
                  ],
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () =>
                    _chooseDate(context, context.read<ChooseDateCubit>()),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.neutralColors900,
                  size: 30.sp,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => calendarCubit.prevMonth(),
                child: Container(
                    padding: const EdgeInsets.all(RMDimensions.xSmall),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.neutralColors300, width: 1.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(RMDimensions.small2),
                      ),
                    ),
                    child: SvgPicture.asset(Assets.icons.arrowLeft)),
              ),
              const SizedBox(
                width: RMDimensions.small2,
              ),
              InkWell(
                onTap: () => calendarCubit.nextMonth(),
                child: Container(
                  padding: const EdgeInsets.all(RMDimensions.xSmall),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.neutralColors300, width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(RMDimensions.small2),
                    ),
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.arrowRight,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: RMDimensions.large),
        SizedBox(
          height: 68.h,
          child: ListView.separated(
            padding:
                const EdgeInsets.symmetric(horizontal: RMDimensions.medium),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final day = index + 1;
              final isSelected = day == calendarCubit.selectedDate.day;

              return GestureDetector(
                onTap: () => calendarCubit.selectDay(day),
                child: Container(
                  alignment: Alignment.center,
                  width: 48.w,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.neutralColors900
                        : AppColors.neutralColors0,
                    borderRadius: BorderRadius.circular(RMDimensions.small2),
                    boxShadow: [
                      RMShadow.medium,
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        calendarCubit.getDayOfWeek(day),
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: isSelected
                              ? AppColors.neutralColors0
                              : AppColors.neutralColors500,
                          fontVariations: [
                            const FontVariation.weight(700),
                          ],
                        ),
                      ),
                      const SizedBox(height: RMDimensions.small),
                      Text(
                        day.toString(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: isSelected
                                  ? AppColors.neutralColors0
                                  : AppColors.neutralColors900,
                            ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: RMDimensions.small2,
            ),
            itemCount: DateTime(
              calendarCubit.selectedDate.year,
              calendarCubit.selectedDate.month + 1,
              0,
            ).day,
          ),
        ),
      ],
    );
  }

  Future<void> _chooseDate(
      BuildContext context, ChooseDateCubit chooseDateCubit) async {
    await showCupertinoModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) => Material(
          child: BlocProvider.value(
        value: chooseDateCubit,
        child: const ChooseDateScreen(),
      )),
    );
  }
}
