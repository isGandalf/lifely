import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/notification_errors.dart';
import 'package:lifely/features/notifications/domain/entity/notification_entity.dart';
import 'package:lifely/features/notifications/domain/repository/notification_repository.dart';

class NotificationUsecases {
  final NotificationRepository notificationRepository;

  NotificationUsecases({required this.notificationRepository});

  // fetch all notifications
  Future<Either<NotificationErrors, List<NotificationEntity>>>
  getAllNotifications() async {
    final result = await notificationRepository.getAllNotifications();

    return result.fold(
      ifLeft: (failure) =>
          Left(FetchNotificationError(message: failure.message)),
      ifRight: (list) => Right(list),
    );
  }

  // save notification
  Future<Either<NotificationErrors, void>> saveNotification(
    NotificationEntity notification,
  ) async {
    final result = await notificationRepository.saveNotification(notification);

    return result.fold(
      ifLeft: (failure) =>
          Left(SaveNotificationError(message: failure.message)),
      ifRight: (success) => Right(success),
    );
  }

  // mark notification as read
  Future<Either<NotificationErrors, void>> markNotificationRead(
    String notificationId,
  ) async {
    final result = await notificationRepository.markNotificationRead(
      notificationId,
    );

    return result.fold(
      ifLeft: (failure) =>
          Left(MarkNotificationReadError(message: failure.message)),
      ifRight: (success) => Right(success),
    );
  }

  // delete notification
  Future<Either<NotificationErrors, void>> deleteNotification(
    String notificationId,
  ) async {
    final result = await notificationRepository.deleteNotification(
      notificationId,
    );

    return result.fold(
      ifLeft: (failure) =>
          Left(DeleteNotificationError(message: failure.message)),
      ifRight: (success) => Right(success),
    );
  }
}
