import 'package:ringo_media/features/project_feature/domain/cubit/project_summary_cubit.dart';
import 'package:ringo_media/features/project_feature/views/project_screen/components/bars_paint_widget.dart';
import 'package:ringo_media/file_export.dart';

class ProjectScreenProductivityWidget extends StatefulWidget {
  const ProjectScreenProductivityWidget({super.key});

  @override
  State<ProjectScreenProductivityWidget> createState() =>
      _ProjectScreenProductivityWidgetState();
}

class _ProjectScreenProductivityWidgetState
    extends State<ProjectScreenProductivityWidget> {
  @override
  Widget build(BuildContext context) {
    final projectCubit = context.watch<ProjectSummaryCubit>();
    return Container(
      color: AppColors.neutralColors0,
      padding: const EdgeInsets.all(RMDimensions.xLarge),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Productivity",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontVariations: [
                    const FontVariation.weight(700),
                  ],
                ),
              ),
              const Spacer(),
              SvgPicture.asset(Assets.icons.more),
            ],
          ),
          const SizedBox(
            height: RMDimensions.xxxLarge,
          ),
          GestureDetector(
            onTapUp: (details) {
              final RenderBox box = context.findRenderObject() as RenderBox;
              final Offset localPosition =
                  box.globalToLocal(details.globalPosition);
              projectCubit.handleTap(localPosition);
            },
            child: CustomPaint(
              size: Size(
                  ScreenUtil().screenWidth / 1.2, ScreenUtil().screenWidth / 2),
              painter: BarChartPainter(projectCubit.data, projectCubit.labels,
                  projectCubit.touchedIndex),
            ),
          ),
          const SizedBox(
            height: RMDimensions.xxxLarge,
          ),
        ],
      ),
    );
  }
}
