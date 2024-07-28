import 'package:ringo_media/common/rm_app_bar_widget.dart';
import 'package:ringo_media/features/project_feature/views/project_screen/components/project_screen_header_widget.dart';
import 'package:ringo_media/features/project_feature/views/project_screen/components/project_screen_productivity_widget.dart';
import 'package:ringo_media/file_export.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});
  static const routeName = "/ProjectScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColors200,
      appBar: RMAppBarWidget(
        centerTitle: false,
        titleWidget: Text(
          "Project Summary",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontVariations: [
              const FontVariation.weight(700),
            ],
          ),
        ),
        toolbarHeight: 70.h,
        bottom: const Divider(
          height: 10,
          thickness: 1.5,
          color: AppColors.neutralColors200,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProjectScreenHeaderWidget(),
            ProjectScreenProductivityWidget()
          ],
        ),
      ),
    );
  }
}
