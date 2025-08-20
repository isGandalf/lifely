import 'package:lifely/features/dashboard/domain/entity/class_missions.dart';

abstract class MissionDashboardRepository {
  List<ClassMissions> getClassMissions();
}
