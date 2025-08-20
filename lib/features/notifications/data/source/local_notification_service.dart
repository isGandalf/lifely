import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

    // ✅ Android 13+ requires runtime notification permission
    final androidPlugin = notificationPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (androidPlugin != null) {
      // create channel
      const androidChannel = AndroidNotificationChannel(
        'mission_notification_id',
        'Mission Notifications',
        description: 'Mission completion notifications',
        importance: Importance.max,
      );
      await androidPlugin.createNotificationChannel(androidChannel);

      // request permission on Android 13+
      await androidPlugin.requestNotificationsPermission();
    }

    _isInitialized = true;
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
