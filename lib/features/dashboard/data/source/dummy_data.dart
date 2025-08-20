import 'package:lifely/features/dashboard/data/models/class_mission_model.dart';
import 'package:lifely/features/dashboard/data/models/weekly_mission_model.dart';

final dummyData = [
  ClassMissionModel(
    classname: 'Class I',
    weeklyMissions: [
      WeeklyMissionModel(week: 'Week 1', completed: 3),
      WeeklyMissionModel(week: 'Week 2', completed: 6),
      WeeklyMissionModel(week: 'Week 3', completed: 11),
      WeeklyMissionModel(week: 'Week 4', completed: 8),
    ],
  ),
  ClassMissionModel(
    classname: 'Class II',
    weeklyMissions: [
      WeeklyMissionModel(week: 'Week 1', completed: 5),
      WeeklyMissionModel(week: 'Week 2', completed: 7),
      WeeklyMissionModel(week: 'Week 3', completed: 6),
      WeeklyMissionModel(week: 'Week 4', completed: 9),
    ],
  ),
  ClassMissionModel(
    classname: 'Class III',
    weeklyMissions: [
      WeeklyMissionModel(week: 'Week 1', completed: 4),
      WeeklyMissionModel(week: 'Week 2', completed: 6),
      WeeklyMissionModel(week: 'Week 3', completed: 5),
      WeeklyMissionModel(week: 'Week 4', completed: 7),
    ],
  ),
  ClassMissionModel(
    classname: 'Class IV',
    weeklyMissions: [
      WeeklyMissionModel(week: 'Week 1', completed: 8),
      WeeklyMissionModel(week: 'Week 2', completed: 10),
      WeeklyMissionModel(week: 'Week 3', completed: 7),
      WeeklyMissionModel(week: 'Week 4', completed: 6),
    ],
  ),
  ClassMissionModel(
    classname: 'Class V',
    weeklyMissions: [
      WeeklyMissionModel(week: 'Week 1', completed: 9),
      WeeklyMissionModel(week: 'Week 2', completed: 11),
      WeeklyMissionModel(week: 'Week 3', completed: 10),
      WeeklyMissionModel(week: 'Week 4', completed: 12),
    ],
  ),
];
