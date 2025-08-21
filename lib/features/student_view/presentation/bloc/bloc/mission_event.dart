part of 'mission_bloc.dart';

@immutable
sealed class MissionEvent {}

final class MissionLoadEvent extends MissionEvent {}

final class FetchMissionFromRemoteAndSaveToLocalEvent extends MissionEvent {}

final class MissionStepPressedEvent extends MissionEvent {
  final bool value;
  final String missionId;

  MissionStepPressedEvent({required this.value, required this.missionId});
}

final class MissionSyncEvent extends MissionEvent {}

final class MissionSubmitButtonPressedEvent extends MissionEvent {
  final String missionTitle;
  final String missionDescription;

  MissionSubmitButtonPressedEvent({
    required this.missionTitle,
    required this.missionDescription,
  });
}

final class ShowSystemNotificaitonOnMissionCompleteEvent extends MissionEvent {
  final String notificationTitle;
  final String notificationDescription;

  ShowSystemNotificaitonOnMissionCompleteEvent({
    required this.notificationTitle,
    required this.notificationDescription,
  });
}
