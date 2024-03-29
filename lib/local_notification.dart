// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

// Project imports:
import 'package:intern_practice/repository/local_notification_repository.dart';
import 'package:intern_practice/repository/shared_preferences_repository.dart';

class LocalNotification extends StatefulWidget {
  const LocalNotification({
    super.key,
  });
  @override
  _LocalNotificationState createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  final NotificationRepo = LocalNotificationRepository();
  final SharedPreferencesRepo = SharedPreferencesRepository();
  bool? remind;
  bool? celebrate;

  @override
  void initState() {
    super.initState();
    NotificationRepo.setupNotifications();
    _init();
  }

  Future<void> _init() async {
    remind = await SharedPreferencesRepo.getCelebrateNotification() ?? false;
    celebrate = await SharedPreferencesRepo.getCelebrateNotification() ?? false;

    setState(() {
      remind = remind;
      celebrate = celebrate;
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterAppBadger.removeBadge();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                final remind = this.remind;
                final celebrate = this.celebrate;
                if (remind == null || celebrate == null) {
                  return const CircularProgressIndicator();
                }
                return SwitchListTile.adaptive(
                  title: const Text('Enable notifications'),
                  value: remind,
                  onChanged: (bool value) async {
                    if (value) {
                      await NotificationRepo.subscribe(
                        NotificationType.celebrate,
                      );
                    } else {
                      await NotificationRepo.cancel(NotificationType.remind);
                    }
                    //ローカルにフラグを保存
                    await SharedPreferencesRepo.setCelebrateNotification(value);
                    setState(() {
                      this.remind = value;
                    });
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (remind ?? true) {
                  await NotificationRepo.sendNotification();
                }
              },
              child: const Text('send Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
