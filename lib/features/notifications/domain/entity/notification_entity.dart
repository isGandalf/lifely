class NotificationEntity {
  final String notificationId;
  final String notificationTitle;
  final String notificationDescription;
  final DateTime createdAt;
  final bool isRead;

  NotificationEntity({
    required this.notificationId,
    required this.notificationTitle,
    required this.notificationDescription,
    required this.createdAt,
    required this.isRead,
  });

  NotificationEntity copyWith({
    String? notificationId,
    String? notificationTitle,
    String? notificationDescription,
    DateTime? createdAt,
    bool? isRead,
  }) {
    return NotificationEntity(
      notificationId: notificationId ?? this.notificationId,
      notificationTitle: notificationTitle ?? this.notificationTitle,
      notificationDescription: notificationDescription ?? this.notificationDescription,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
    );
  }
}
