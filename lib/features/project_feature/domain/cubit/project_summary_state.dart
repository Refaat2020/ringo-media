part of 'project_summary_cubit.dart';

@immutable
sealed class ProjectSummaryState {}

final class ProjectSummaryInitial extends ProjectSummaryState {}

final class ProjectSummaryUpdateIndex extends ProjectSummaryState {}
