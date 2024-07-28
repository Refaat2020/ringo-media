import 'package:ringo_media/features/calendar_feature/views/calendar_screen/components/calendar_task_card_widget.dart';
import 'package:ringo_media/file_export.dart';

class CalendarListTaskWidget extends StatelessWidget {
  const CalendarListTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neutralColors0,
      padding: const EdgeInsets.only(top: RMDimensions.medium),
      child: SizedBox(
        height: ScreenUtil().screenHeight / 2.4,
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(RMDimensions.xLarge),
          itemBuilder: (context, index) => const CalendarTaskCardWidget(),
          separatorBuilder: (context, index) => const SizedBox(
            height: RMDimensions.medium,
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
