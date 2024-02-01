import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class LocalNotification extends StatefulWidget {  

  const LocalNotification({
    super.key,
  });
  @override
  _LocalNotificationState createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {

  final flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
  bool notificationsEnabled = false;

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

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    _requestPermissions();
  }

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _scheduleDaily8AMNotification,
          child: const Text('Go back!'),
        ),
      )
    );
  }
}

