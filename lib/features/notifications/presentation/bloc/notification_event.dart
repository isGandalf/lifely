part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}

final class NotificationLoadEvent extends NotificationEvent {}

final class NotificationSaveEvent extends NotificationEvent {
  final String notificationTitle;
  final String notificationDescription;

  NotificationSaveEvent({
    required this.notificationTitle,
    required this.notificationDescription,
  });
}

final class NotificationMarkAsReadEvent extends NotificationEvent {
  final int notificationId;

  NotificationMarkAsReadEvent({required this.notificationId});
}

final class NotificationDeleteEvent extends NotificationEvent {
  final int notificationId;

  NotificationDeleteEvent({required this.notificationId});
}

// final class MissionSubmitButtonPressedEvent extends NotificationEvent {
//   final String notificationTitle;
//   final String notificationDescription;

//   MissionSubmitButtonPressedEvent({
//     required this.notificationTitle,
//     required this.notificationDescription,
//   });
// }
