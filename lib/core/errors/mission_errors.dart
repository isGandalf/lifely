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
