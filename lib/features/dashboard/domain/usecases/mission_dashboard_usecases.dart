import 'package:lifely/features/dashboard/domain/entity/class_missions.dart';
import 'package:lifely/features/dashboard/domain/repository/mission_dashboard_repository.dart';

class MissionDashboardUsecases {
  final MissionDashboardRepository missionDashboardRepository;

  MissionDashboardUsecases({required this.missionDashboardRepository});

  List<ClassMissions> getClassMissions() {
    return missionDashboardRepository.getClassMissions();
  }
}
