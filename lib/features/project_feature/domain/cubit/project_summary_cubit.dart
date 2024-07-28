import 'package:ringo_media/file_export.dart';

part 'project_summary_state.dart';

class ProjectSummaryCubit extends Cubit<ProjectSummaryState> {
  ProjectSummaryCubit() : super(ProjectSummaryInitial());
  int? touchedIndex;

  final List<double> data = [50, 30, 40, 56, 35, 25];

  final List<String> labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

  void handleTap(Offset position) {
    const barWidth = 30.0;
    const spacing = 20.0;
    final x = position.dx;
    for (int i = 0; i <= data.length; i++) {
      final left = i * (barWidth + spacing) + spacing;
      final right = left + barWidth;

      if (x >= left && x <= right) {
        touchedIndex = i - 1;
        emit(ProjectSummaryUpdateIndex());

        return;
      }
    }
    touchedIndex = null;
    emit(ProjectSummaryUpdateIndex());
  }
}
