import 'package:ringo_media/features/calendar_feature/data/models/task_model.dart';
import 'package:ringo_media/file_export.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: task.color,
              borderRadius:
                  const BorderRadius.all(Radius.circular(RMDimensions.small2)),
            ),
            child: Row(
              children: [
                Container(
                  width: 6.0,
                  padding: const EdgeInsets.all(RMDimensions.xxxLarge),
                  decoration: BoxDecoration(
                    color: task.borderColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(RMDimensions.small2),
                      bottomLeft: Radius.circular(RMDimensions.small2),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: RMDimensions.medium,
                    horizontal: RMDimensions.large,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontVariations: [
                            const FontVariation.weight(600),
                          ],
                        ),
                      ),
                      const SizedBox(height: RMDimensions.small2),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.clock,
                            colorFilter: const ColorFilter.mode(
                                AppColors.neutralColors500, BlendMode.srcIn),
                          ),
                          const SizedBox(width: RMDimensions.small2),
                          Text(
                            task.time,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                              color: AppColors.neutralColors500,
                              fontVariations: [
                                const FontVariation.weight(500),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
