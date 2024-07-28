import 'package:ringo_media/common/rm_shadow.dart';
import 'package:ringo_media/file_export.dart';

class CalendarTaskCardWidget extends StatelessWidget {
  const CalendarTaskCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: RMDimensions.small3),
      decoration: BoxDecoration(
        color: AppColors.neutralColors0,
        border: Border.all(
          color: AppColors.neutralColors50,
        ),
        borderRadius:
            const BorderRadius.all(Radius.circular(RMDimensions.small2)),
        boxShadow: [
          RMShadow.medium2,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(RMDimensions.medium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meeting Concept',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontVariations: [const FontVariation.weight(500)],
                  ),
                ),
                const SizedBox(height: RMDimensions.small),
                Text(
                  'Due Date : Mon, 12 Jan 2023',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontVariations: [
                      const FontVariation.weight(400),
                    ],
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.check_box_rounded,
              color: AppColors.additionalGreen,
            ),
          ],
        ),
      ),
    );
  }
}
