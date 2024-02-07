// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  //ローカル通知
  final keyFaceRemind = 'faceRemindNotification';
  final cameraPerm = 'camera_permission_dialog_denied';


  Future<void> setCelebrateNotification({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyFaceRemind, value);
  }

  Future<bool?> getCelebrateNotification() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyFaceRemind);
  }

  Future<void> setCameraPermission({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(cameraPerm, value);
  }

  Future<bool?> getCameraPermission() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(cameraPerm);
  }

  Future<void> removeCameraPermission() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(cameraPerm);
  }
}
