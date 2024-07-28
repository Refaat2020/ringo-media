import 'package:intl/intl.dart';
import 'package:ringo_media/features/calendar_feature/domain/cubit/choose_date_cubit.dart';
import 'package:ringo_media/features/calendar_feature/views/choose_date_screen/components/days_of_week_widget.dart';
import 'package:ringo_media/file_export.dart';

class ChooseDateScreen extends StatelessWidget {
  const ChooseDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chooseDate = context.watch<ChooseDateCubit>();
    return Container(
      height: ScreenUtil().screenHeight / 1.34,
      color: AppColors.neutralColors0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: RMDimensions.xLarge, top: RMDimensions.large18),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  "Choose Date",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontVariations: [
                      const FontVariation.weight(700),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => GoRouter.of(context).pop(),
                ),
              ],
            ),
          ),
          const Divider(),
          const DaysOfWeekWidget(),
          Padding(
            padding: const EdgeInsets.all(RMDimensions.large),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => chooseDate.getPreviousMonth(),
                ),
                Text(
                  DateFormat.yMMMM().format(chooseDate.focusedDate),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontVariations: [
                      const FontVariation.weight(600),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () => chooseDate.getNextMonth(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(RMDimensions.large),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: chooseDate.listOfDays.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      chooseDate.onDaySelected(chooseDate.listOfDays[index]),
                  child: Container(
                    decoration: BoxDecoration(
                      color: chooseDate.selectedDay(index)
                          ? Colors.black
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        chooseDate.listOfDays[index].toString(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: chooseDate.selectedDay(index)
                              ? AppColors.neutralColors0
                              : AppColors.neutralColors900,
                          fontVariations: [
                            const FontVariation.weight(600),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          AppButton(
            height: 56.h,
            width: ScreenUtil().screenHeight / 2.4,
            name: "Continue",
            textColors: AppColors.neutralColors0,
            onTap: () => GoRouter.of(context).pop(),
            containerColor: AppColors.neutralColors900,
            borderColor: AppColors.neutralColors900,
            radius: 8,
          ),
        ],
      ),
    );
  }
}
