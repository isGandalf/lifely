abstract class NotificationErrors {
  String get message;

  @override
  String toString() {
    return message;
  }
}

class ShowNotificationError extends NotificationErrors {
  @override
  final String message;

  ShowNotificationError({required this.message});
}

class SaveNotificationError extends NotificationErrors {
  @override
  final String message;

  SaveNotificationError({required this.message});
}

class FetchNotificationError extends NotificationErrors {
   @override
  final String message;

  FetchNotificationError({required this.message});
}

class DeleteNotificationError extends NotificationErrors {
  @override
  final String message;

  DeleteNotificationError({required this.message});
}

class MarkNotificationReadError extends NotificationErrors {
  @override
  final String message;

  MarkNotificationReadError({required this.message});
}
