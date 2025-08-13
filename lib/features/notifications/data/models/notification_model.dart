import 'package:isar/isar.dart';
import 'package:lifely/features/notifications/domain/entity/notification_entity.dart';

// command: dart run build_runner build --delete-conflicting-outputs
part 'notification_model.g.dart';

@collection
class NotificationModel {
  Id isarId = Isar.autoIncrement; // local storage id

  late String notificationId;
  late String notificationTitle;
  late String notificationDescription;
  late DateTime createdAt;
  late bool isRead;

  NotificationModel();

  NotificationEntity toEntity() {
    return NotificationEntity(
      notificationId: notificationId,
      notificationTitle: notificationTitle,
      notificationDescription: notificationDescription,
      createdAt: createdAt,
      isRead: isRead,
    );
  }

  static NotificationModel fromEntity(NotificationEntity entity) {
    return NotificationModel()
      ..notificationId = entity.notificationId
      ..notificationTitle = entity.notificationTitle
      ..notificationDescription = entity.notificationDescription
      ..createdAt = entity.createdAt
      ..isRead = entity.isRead;
  }

  NotificationModel copyWith({
    String? notificationId,
    String? notificationTitle,
    String? notificationDescription,
    DateTime? createdAt,
    bool? isRead,
  }) {
    return NotificationModel()
      ..isarId = isarId
      ..notificationId = notificationId ?? this.notificationId
      ..notificationTitle = notificationTitle ?? this.notificationTitle
      ..notificationDescription =
          notificationDescription ?? this.notificationDescription
      ..createdAt = createdAt ?? this.createdAt
      ..isRead = isRead ?? this.isRead;
  }
}
