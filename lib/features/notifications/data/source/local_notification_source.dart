import 'package:dart_either/dart_either.dart';
import 'package:isar/isar.dart';
import 'package:lifely/core/errors/notification_errors.dart';
import 'package:lifely/features/notifications/data/models/notification_model.dart';

class LocalNotificationSource {
  final Isar db;

  LocalNotificationSource({required this.db});

  // save notification to local
  Future<Either<NotificationErrors, void>> saveNotification(
    NotificationModel notification,
  ) async {
    try {
      await db.writeTxn(() async {
        await db.notificationModels.put(notification);
      });

      return const Right(null);
    } on Exception catch (e) {
      return Left(
        SaveNotificationError(
          message: 'An error occured while saving notification --> $e',
        ),
      );
    } catch (e) {
      return Left(
        SaveNotificationError(
          message:
              'An unexpected error occured while saving notification --> $e',
        ),
      );
    }
  }

  // fetch notifications
  Future<Either<NotificationErrors, List<NotificationModel>>>
  fetchNotificationsFromLocal() async {
    try {
      final result = await db.notificationModels.where().findAll();
      return Right(result);
    } on Exception catch (e) {
      return Left(
        FetchNotificationError(
          message: 'An error occured while fetching notification --> $e',
        ),
      );
    } catch (e) {
      return Left(
        FetchNotificationError(
          message:
              'An unexpected error occured while fetching notification --> $e',
        ),
      );
    }
  }

  // update notification - isRead = true
  Future<Either<NotificationErrors, void>> isNotificationRead(
    String notificationId,
  ) async {
    try {
      final notification = await db.notificationModels
          .filter()
          .notificationIdEqualTo(notificationId)
          .findFirst();

      if (notification == null) {
        return Left(
          MarkNotificationReadError(
            message: 'No notification with the $notificationId found',
          ),
        );
      }

      await db.writeTxn(() async {
        await db.notificationModels.put(
          notification.copyWith(isRead: !notification.isRead),
        );
      });

      return const Right(null);
    } on Exception catch (e) {
      return Left(
        MarkNotificationReadError(
          message: 'An error occured while updating notification --> $e',
        ),
      );
    } catch (e) {
      return Left(
        MarkNotificationReadError(
          message:
              'An unexpected error occured while updating notification --> $e',
        ),
      );
    }
  }

  // delete notification
  Future<Either<NotificationErrors, void>> deleteNotification(
    String notificationId,
  ) async {
    try {
      final deletedCount = await db.writeTxn(() async {
        return await db.notificationModels
            .filter()
            .notificationIdEqualTo(notificationId)
            .deleteAll();
      });

      if (deletedCount == 0) {
        return Left(
          DeleteNotificationError(
            message: 'No notification with the $notificationId found',
          ),
        );
      }

      return const Right(null);
    } on Exception catch (e) {
      return Left(
        DeleteNotificationError(
          message: 'An error occured while deleting notification --> $e',
        ),
      );
    } catch (e) {
      return Left(
        DeleteNotificationError(
          message:
              'An unexpected error occured while deleting notification --> $e',
        ),
      );
    }
  }
}
