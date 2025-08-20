import 'package:lifely/features/dashboard/domain/entity/weekly_mission.dart';

class ClassMissions {
  final String className;
  final List<WeeklyMission> weeklyMissions;

  ClassMissions({required this.className, required this.weeklyMissions});
}
