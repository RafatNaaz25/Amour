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
    apiKey: 'AIzaSyBZPHUm-bN54nU7B_My41fnDS1pRtyNLHY',
    appId: '1:292860609533:web:73e504c47a24ac5d6e8f94',
    messagingSenderId: '292860609533',
    projectId: 'dating-app-bbb72',
    authDomain: 'dating-app-bbb72.firebaseapp.com',
    storageBucket: 'dating-app-bbb72.appspot.com',
    measurementId: 'G-G1QJ58ZF5W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANfQHfvQRX2mHEbQhQot33MeUiR3xlo9w',
    appId: '1:292860609533:android:26877698d1a5dd026e8f94',
    messagingSenderId: '292860609533',
    projectId: 'dating-app-bbb72',
    storageBucket: 'dating-app-bbb72.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcNV4jmRwsvYYGjXc7RVVJ-LwKUv7GpqI',
    appId: '1:292860609533:ios:75824289914d4a096e8f94',
    messagingSenderId: '292860609533',
    projectId: 'dating-app-bbb72',
    storageBucket: 'dating-app-bbb72.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcNV4jmRwsvYYGjXc7RVVJ-LwKUv7GpqI',
    appId: '1:292860609533:ios:7729991c690646786e8f94',
    messagingSenderId: '292860609533',
    projectId: 'dating-app-bbb72',
    storageBucket: 'dating-app-bbb72.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
