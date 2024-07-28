import 'package:ringo_media/features/calendar_feature/domain/cubit/choose_date_cubit.dart';
import 'package:ringo_media/file_export.dart';

class DaysOfWeekWidget extends StatelessWidget {
  const DaysOfWeekWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final chooseDate = context.watch<ChooseDateCubit>();
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          left: RMDimensions.xxxLarge2,
          top: RMDimensions.xLarge,
        ),
        itemBuilder: (context, index) => Text(
          chooseDate.days[index],
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontVariations: [
              const FontVariation.weight(600),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: RMDimensions.xxxLarge2,
        ),
        itemCount: chooseDate.days.length,
      ),
    );
  }
}
