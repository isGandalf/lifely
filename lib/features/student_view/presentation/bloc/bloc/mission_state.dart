part of 'mission_bloc.dart';

@immutable
sealed class MissionState {}

final class MissionInitial extends MissionState {}

// Action states
final class MissionActionStates extends MissionState {}

final class MissionStepUpdateSuccessState extends MissionActionStates {}

final class MissionStepUpdateFailedState extends MissionActionStates {
  final String error;

  MissionStepUpdateFailedState({required this.error});
}


final class NotificationSentSuccessState extends MissionActionStates {}

final class NotificationSentFailedState extends MissionActionStates {}

final class NotificationSaveSuccessState extends MissionActionStates {}

final class NotificationSaveFailedState extends MissionActionStates {
  final String error;

  NotificationSaveFailedState({required this.error});
}



// =========================================================
// Non Action states
final class MissionNonActionStates extends MissionState {}

final class MissionLoadingState extends MissionNonActionStates {}

final class MissionLoadedState extends MissionNonActionStates {
  final List<Mission> missionList;

  MissionLoadedState({required this.missionList});
}

final class MissionLoadingFailedState extends MissionNonActionStates {
  final String error;

  MissionLoadingFailedState({required this.error});
}

final class MissionFetchedFromRemoteState extends MissionNonActionStates {
  final List<Mission> missionList;

  MissionFetchedFromRemoteState({required this.missionList});
}

final class MissionFetchFromRemoteFailedState extends MissionNonActionStates {
  final String error;

  MissionFetchFromRemoteFailedState({required this.error});
}

final class MissionFetchedFromRemoteAndSavedToLocalSuccessState
    extends MissionNonActionStates {}

final class MissionFetchedFromRemoteAndSavedToLocalFailedState
    extends MissionNonActionStates {}

final class NoInternetConnection extends MissionNonActionStates {}


final class SyncSuccessState extends MissionNonActionStates {}

final class SyncFailedState extends MissionNonActionStates {
  final String message;

  SyncFailedState({required this.message});
}
