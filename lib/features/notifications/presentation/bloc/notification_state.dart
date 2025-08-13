part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

// action states
final class NotificationActionStates extends NotificationState {}

final class NotificationReadSuccessState extends NotificationActionStates {}

final class NotificationReadFailedState extends NotificationActionStates {
  final String error;

  NotificationReadFailedState({required this.error});
}

final class NotificationDeleteSuccessState extends NotificationActionStates {}

final class NotificationDeleteFailedState extends NotificationActionStates {
  final String error;

  NotificationDeleteFailedState({required this.error});
}

final class NotificationSentSuccessState extends NotificationActionStates {}

final class NotificationSentFailedState extends NotificationActionStates {}

// Non action states
final class NotificationNonActionStates extends NotificationState {}

final class NotificationLoadingState extends NotificationNonActionStates {}

final class NotificationLoadedState extends NotificationNonActionStates {
  final List<NotificationEntity> notifications;

  NotificationLoadedState({required this.notifications});
}

final class NotificationLoadingFailedState extends NotificationNonActionStates {
  final String error;

  NotificationLoadingFailedState({required this.error});
}

final class NotificationSaveSuccessState extends NotificationActionStates {}

final class NotificationSaveFailedState extends NotificationActionStates {
  final String error;

  NotificationSaveFailedState({required this.error});
}
