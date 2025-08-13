import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lifely/features/notifications/data/models/notification_model.dart';
import 'package:lifely/features/notifications/domain/entity/notification_entity.dart';

class LocalNotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  // INITIALIZE
  Future<void> initNotification() async {
    if (_isInitialized) return;

    // android initialization
    const initSettingsForAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initSettings = InitializationSettings(
      android: initSettingsForAndroid,
    );

    // initialize the plugin
    await notificationPlugin.initialize(initSettings);
  }

  // NOTIFICATIONS SETUP
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'mission_notification_id',
        'Mission Notifications',
        channelDescription: 'Mission complettion notifications',
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
    );
  }

  // SHOW NOTIFICATION
  Future<void> showNotification({int? id, String? title, String? body}) async {
    return notificationPlugin.show(id!, title!, body!, notificationDetails());
  }

  // ON NOTIFICATION TAP
}
