abstract class MissionErrors {
  String get message;

  @override
  String toString() {
    return message;
  }
}

class FetchMissionError extends MissionErrors {
  @override
  final String message;

  FetchMissionError({required this.message});
}

class AddMissionError extends MissionErrors {
  @override
  final String message;

  AddMissionError({required this.message});
}

class SaveMissionToLocalError extends MissionErrors {
  @override
  final String message;

  SaveMissionToLocalError({required this.message});
}

class RemoteSyncError extends MissionErrors {
  @override
  final String message;

  RemoteSyncError({required this.message});
}
