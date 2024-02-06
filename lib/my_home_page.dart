// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_practice/repository/shared_preferences_repository.dart';
import 'package:permission_handler/permission_handler.dart';

enum CameraPermissionStatus {
  granted,
  denied,
  restricted,
  limited,
  permanentlyDenied
}

class CameraPermissionsHandler {
  final sharedPreferencesRepo = SharedPreferencesRepository();
  bool? perm;

  Future<bool> get isGranted async {
    final perm = await sharedPreferencesRepo.getCameraPermission();
    if (perm == null) {
      return false;
    }
    final status = await Permission.camera.status;
    switch (status) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
        return true;
      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.restricted:
        return false;
      default: return false;
    }
  }

  Future<CameraPermissionStatus> request() async {
    await sharedPreferencesRepo.setCameraPermission(value: true);

    final status = await Permission.camera.request();
    switch (status) {
      case PermissionStatus.granted:
        return CameraPermissionStatus.granted;
      case PermissionStatus.denied:
        return CameraPermissionStatus.denied;
      case PermissionStatus.limited:
        return CameraPermissionStatus.limited;
      case PermissionStatus.restricted:
        return CameraPermissionStatus.restricted;
      case PermissionStatus.permanentlyDenied:
        return CameraPermissionStatus.permanentlyDenied;
      default:
        return CameraPermissionStatus.denied;
    }
  }

  Future<void> remove() async {
    await sharedPreferencesRepo.removeCameraPermission();
  }
}

class PermissionPage extends HookConsumerWidget {
  const PermissionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      // リクエストを出す処理
      CameraPermissionsHandler().request();
      return null;
    }, []);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FutureBuilder<String>(
              future: CameraPermissionsHandler().isGranted
                  .then((value) => value ? '許可されています' : '許可されていません'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('エラー: ${snapshot.error}');
                } else {
                  return Text('カメラの許可状態: ${snapshot.data}');
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: (){
              CameraPermissionsHandler().remove();
            }, 
            child: const Text('許可を取り消す')
          )
        ],
      ),
    );
  }
}
