import 'package:lifely/features/dashboard/domain/entity/weekly_mission.dart';

class WeeklyMissionModel {
  final String week;
  final int completed;

  WeeklyMissionModel({required this.week, required this.completed});

  WeeklyMission toEntity() {
    return WeeklyMission(week: week, completed: completed);
  }
}
