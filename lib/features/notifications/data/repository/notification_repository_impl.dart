// ignore: implementation_imports
import 'package:dart_either/src/dart_either.dart';
import 'package:lifely/core/errors/notification_errors.dart';
import 'package:lifely/features/notifications/data/models/notification_model.dart';
import 'package:lifely/features/notifications/data/source/local_notification_source.dart';
import 'package:lifely/features/notifications/domain/entity/notification_entity.dart';
import 'package:lifely/features/notifications/domain/repository/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final LocalNotificationSource localNotificationSource;

  NotificationRepositoryImpl({required this.localNotificationSource});

  @override
  Future<Either<NotificationErrors, void>> saveNotification(
    NotificationEntity notification,
  ) async {
    final notificationModel = NotificationModel.fromEntity(notification);
    final result = await localNotificationSource.saveNotification(
      notificationModel,
    );
    return result.fold(
      ifLeft: (failure) =>
          Left(SaveNotificationError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  @override
  Future<Either<NotificationErrors, void>> deleteNotification(int notificationId) async {
    final result = await localNotificationSource.deleteNotification(notificationId);
    return result.fold(
      ifLeft: (failure) =>
          Left(DeleteNotificationError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
    
  }

  @override
  Future<Either<NotificationErrors, List<NotificationEntity>>>
  getAllNotifications() async {
    final result = await localNotificationSource.fetchNotificationsFromLocal();
    return result.fold(
      ifLeft: (failure) =>
          Left(FetchNotificationError(message: failure.message)),
      ifRight: (notifications) => Right(
        notifications.map((e) => e.toEntity()).toList(),
      ),
    );
  }

  @override
  Future<Either<NotificationErrors, NotificationEntity>> getOneNotification() {
    throw UnimplementedError();
  }

  @override
  Future<Either<NotificationErrors, void>> markNotificationRead(int notificationId) async {
    final result = await localNotificationSource.isNotificationRead(notificationId);
    return result.fold(
      ifLeft: (failure) =>
          Left(MarkNotificationReadError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }
}
