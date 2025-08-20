import 'package:lifely/features/dashboard/data/source/dashboard_mission_source.dart';
import 'package:lifely/features/dashboard/domain/entity/class_missions.dart';
import 'package:lifely/features/dashboard/domain/repository/mission_dashboard_repository.dart';

class MissionDashboardRepositoryImpl implements MissionDashboardRepository {
  final DashboardMissionSource dashboardMissionSource;

  MissionDashboardRepositoryImpl({required this.dashboardMissionSource});
  @override
  List<ClassMissions> getClassMissions() {
    final result = dashboardMissionSource.fetchClassMissions();

    final entityList = result.map((e) => e.toEntity()).toList();

    return entityList;
  }
}
