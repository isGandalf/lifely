class Mission {
  final String? id; // remote id
  final String missionId;
  final String missionTitle;
  final String missionDescription;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isSynced;
  final int totalSteps;
  final int completedSteps;

  Mission({
    this.id,
    required this.missionId,
    required this.missionTitle,
    required this.missionDescription,
    required this.createdAt,
    required this.updatedAt,
    this.isSynced = false,
    required this.totalSteps,
    required this.completedSteps,
  });

  Mission copyWith({
    String? id,
    String? missionId,
    String? missionTitle,
    String? missionDescription,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
    int? totalSteps,
    int? completedSteps
  }) {
    return Mission(
      id: id ?? this.id,
      missionId: missionId ?? this.missionId,
      missionTitle: missionTitle ?? this.missionTitle,
      missionDescription: missionDescription ?? this.missionDescription,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      totalSteps: totalSteps ?? this.totalSteps,
      completedSteps: completedSteps ?? this.completedSteps
    );
  }
}
