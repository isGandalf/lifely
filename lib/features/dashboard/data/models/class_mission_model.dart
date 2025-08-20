import 'package:lifely/features/dashboard/data/models/weekly_mission_model.dart';
import 'package:lifely/features/dashboard/domain/entity/class_missions.dart';

class ClassMissionModel {
  final String classname;
  final List<WeeklyMissionModel> weeklyMissions;

  ClassMissionModel({required this.classname, required this.weeklyMissions});

  ClassMissions toEntity() {
    return ClassMissions(
      className: classname,
      weeklyMissions: weeklyMissions.map((e) => e.toEntity()).toList(),
    );
  }
}
