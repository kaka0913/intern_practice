// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDyNYxiLR-vMKmrVa9MAS_VZmAq29vVJes',
    appId: '1:616083116036:web:d00536779a3203ee7c6551',
    messagingSenderId: '616083116036',
    projectId: 'venir-70486',
    authDomain: 'venir-70486.firebaseapp.com',
    storageBucket: 'venir-70486.appspot.com',
    measurementId: 'G-60SLVP8VR1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWi-GZti5ChaFDzOOiA5nXH7Mm8M_lUnQ',
    appId: '1:616083116036:android:05a1c9d4be610cb77c6551',
    messagingSenderId: '616083116036',
    projectId: 'venir-70486',
    storageBucket: 'venir-70486.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdf-ItK-ommCezdlNWuyRztPzJVqMgKbg',
    appId: '1:616083116036:ios:625e283f843544917c6551',
    messagingSenderId: '616083116036',
    projectId: 'venir-70486',
    storageBucket: 'venir-70486.appspot.com',
    iosBundleId: 'com.example.internPractice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAdf-ItK-ommCezdlNWuyRztPzJVqMgKbg',
    appId: '1:616083116036:ios:956fd75fbfed08ba7c6551',
    messagingSenderId: '616083116036',
    projectId: 'venir-70486',
    storageBucket: 'venir-70486.appspot.com',
    iosBundleId: 'com.example.internPractice.RunnerTests',
  );
}
