part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class DashboardDataFetchEvent extends DashboardEvent {}

class DashboardDataClassChangeEvent extends DashboardEvent {
  final String classname;

  DashboardDataClassChangeEvent({required this.classname});
}
