import 'package:isar/isar.dart';
import 'package:lifely/features/student_view/domain/entity/mission.dart';

// to generate isar_model todo object using build runner.
// run command : dart run build_runner build
part 'mission_model.g.dart';

@collection
class MissionModel {
  Id isarId = Isar.autoIncrement; // local id

  String? remoteId; // remote id

  late String missionId; // custom id

  late String missionTitle;
  String? missionDescription;

  late DateTime createdAt;
  DateTime? updatedAt;

  bool isSynced = false;

  late int totalSteps;
  int completedSteps = 0;

  MissionModel();

  // copyWith
  MissionModel copyWith({
    Id? isarId,
    String? remoteId,
    String? missionId,
    String? missionTitle,
    String? missionDescription,
    DateTime? updatedAt,
    bool? isSynced,
    int? totalSteps,
    int? completedSteps,
  }) {
    final copy = MissionModel();
    copy.isarId = isarId ?? this.isarId;
    copy.remoteId = remoteId ?? this.remoteId;
    copy.missionId = missionId ?? this.missionId;
    copy.missionTitle = missionTitle ?? this.missionTitle;
    copy.missionDescription = missionDescription ?? this.missionDescription;
    copy.createdAt = createdAt;
    copy.updatedAt = updatedAt ?? this.updatedAt;
    copy.isSynced = isSynced ?? this.isSynced;
    copy.totalSteps = totalSteps ?? this.totalSteps;
    copy.completedSteps = completedSteps ?? this.completedSteps;

    return copy;
  }

  // convert from dart object to Isar
  static MissionModel fromModelToIsar(MissionModel mission) {
    var model = MissionModel();
    model.isarId = mission.isarId;
    model.remoteId = mission.remoteId;
    model.missionId = mission.missionId;
    model.missionTitle = mission.missionTitle;
    model.missionDescription = mission.missionDescription;
    model.createdAt = mission.createdAt;
    model.updatedAt = mission.updatedAt;
    model.isSynced = mission.isSynced;
    model.totalSteps = mission.totalSteps;
    model.completedSteps = mission.completedSteps;
    return model;
  }

  // convert from model to entity
  Mission toEntity() {
    return Mission(
      id: remoteId,
      missionId: missionId,
      missionTitle: missionTitle,
      missionDescription: missionDescription ?? '',
      createdAt: createdAt,
      updatedAt: updatedAt,
      totalSteps: totalSteps,
      isSynced: isSynced,
      completedSteps: completedSteps,
    );
  }

  // convert from entity to model
  static MissionModel fromEntity(Mission mission) {
    final model = MissionModel()
      ..remoteId = mission.id
      ..missionId = mission.missionId
      ..missionTitle = mission.missionTitle
      ..missionDescription = mission.missionDescription
      ..createdAt = mission.createdAt
      ..updatedAt = mission.updatedAt
      ..isSynced = mission.isSynced
      ..totalSteps = mission.totalSteps
      ..completedSteps = mission.completedSteps;
    return model;
  }

  // Deserialize from mockApi JSON
  factory MissionModel.fromJson(Map<String, dynamic> json) {
    final createdAtValue = DateTime.fromMillisecondsSinceEpoch(
      json['createdAt'] * 1000,
    );
    final updatedAtValue = json['updatedAt'] != null
        ? DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] * 1000)
        : null;
    return MissionModel()
      ..remoteId = json['id'].toString()
      ..missionId = json['missionId'] as String
      ..missionTitle = json['missionTitle'] as String
      ..missionDescription = json['missionDescription'] as String?
      ..createdAt = createdAtValue
      ..updatedAt = updatedAtValue
      ..isSynced = json['isSynced'] as bool? ?? false
      ..totalSteps = json['totalSteps'] as int
      ..completedSteps = json['completedSteps'] as int? ?? 0;
  }

  // Serialize to JSON for mockApi
  Map<String, dynamic> toJson() {
    return {
      'missionId': missionId,
      'missionTitle': missionTitle,
      'missionDescription': missionDescription,
      'createdAt':
          createdAt.millisecondsSinceEpoch ~/ 1000, // convert to seconds
      'updatedAt': updatedAt != null
          ? updatedAt!.millisecondsSinceEpoch ~/ 1000
          : null,
      'isSynced': isSynced,
      'totalSteps': totalSteps,
      'completedSteps': completedSteps,
    };
  }
}
