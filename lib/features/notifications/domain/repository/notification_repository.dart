import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/notification_errors.dart';
import 'package:lifely/features/notifications/domain/entity/notification_entity.dart';

abstract class NotificationRepository {
  // add notification
  Future<Either<NotificationErrors, void>> saveNotification(
    NotificationEntity notification,
  );

  // get all notifications
  Future<Either<NotificationErrors, List<NotificationEntity>>>
  getAllNotifications();

  // get one notification
  Future<Either<NotificationErrors, NotificationEntity>> getOneNotification();

  // delete notification
  Future<Either<NotificationErrors, void>> deleteNotification(String notificationId);

  // mark as read notification
  Future<Either<NotificationErrors, void>> markNotificationRead(String notificationId);
}




// final notificationService = LocalNotificationService();
//                       notificationService.showNotification(
//                         id: 1,
//                         title: 'Testing',
//                         body: 'This is a test',
//                       );