part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoadingState extends DashboardState {}

final class DashboardDataFetchSuccessState extends DashboardState {
  final List<ClassMissions> dashboardData;
  final String selectedClass;

  DashboardDataFetchSuccessState({
    required this.dashboardData,
    required this.selectedClass,
  });

  DashboardDataFetchSuccessState copyWith({
    List<ClassMissions>? dashboardData,
    String? selectedClass,
  }) {
    return DashboardDataFetchSuccessState(
      dashboardData: dashboardData ?? this.dashboardData,
      selectedClass: selectedClass ?? this.selectedClass,
    );
  }
}

final class DashboardDataErrorState extends DashboardState {
  final String error;

  DashboardDataErrorState({required this.error});
}
