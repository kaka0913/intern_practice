// Dart imports:
import 'dart:io';

// Package imports:
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationRepository {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  bool notificationsEnabled = false;

  Future<void> setupNotifications() async {
    await _requestPermissions();
    await _scheduleDaily8AMNotification();
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
  }

  Future<void> sendNotification() async {
    await _scheduleDaily8AMNotification();
  }

  Future<void> _scheduleDaily8AMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'OB-1',
      '本日の顔を撮影をしましょう',
      _nextInstanceOf8AM(),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'ob-1-face-daily',
          'ob-1-face-daily',
          channelDescription: 'Face photo notification',
        ),
        iOS: DarwinNotificationDetails(
          badgeNumber: 1,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  tz.TZDateTime _nextInstanceOf8AM() {
    var now = tz.TZDateTime.now(tz.local);
    now = now.add(const Duration(seconds: 5));
    return now;
  }

  Future<void> cancel(NotificationType type) async {
    await flutterLocalNotificationsPlugin.cancel(type.id);
  }

  //現在は同じ通知形式のままだが、通知IDやタイミングを変更することで活用可能
  Future<void> subscribe(NotificationType type) {
    switch (type) {
      case NotificationType.remind:
        return _scheduleDaily8AMNotification();
      case NotificationType.celebrate:
        return _scheduleDaily8AMNotification();
    }
  }
}

//通知タイプの管理
enum NotificationType {
  remind,
  celebrate;

  int get id {
    switch (this) {
      case NotificationType.remind:
        return 0;
      case NotificationType.celebrate:
        return 1;
    }
  }
}
