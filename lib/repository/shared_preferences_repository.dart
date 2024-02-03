// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  //ローカル通知
  final keyFaceRemind = 'faceRemindNotification';

  Future<void> setCelebrateNotification(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyFaceRemind, value);
  }

  Future<bool?> getCelebrateNotification() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyFaceRemind);
  }
}
