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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCWxki8dUUa1Wx6A-pkMzRa9d53resyfhk',
    appId: '1:306406055777:web:ae7501c50886033bc4af20',
    messagingSenderId: '306406055777',
    projectId: 'trial-server-paid',
    authDomain: 'trial-server-paid.firebaseapp.com',
    databaseURL: 'https://trial-server-paid-default-rtdb.firebaseio.com',
    storageBucket: 'trial-server-paid.appspot.com',
    measurementId: 'G-7QYV6YH27F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAudolKQFRsENaYSDjdBHZPKJOsm-dIsAA',
    appId: '1:306406055777:android:99cda6e79d67287bc4af20',
    messagingSenderId: '306406055777',
    projectId: 'trial-server-paid',
    databaseURL: 'https://trial-server-paid-default-rtdb.firebaseio.com',
    storageBucket: 'trial-server-paid.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRbF2Hgd3BTz8-SbfKUBDMZzSjXpJuKVw',
    appId: '1:306406055777:ios:f93d1374ab6c4eaec4af20',
    messagingSenderId: '306406055777',
    projectId: 'trial-server-paid',
    databaseURL: 'https://trial-server-paid-default-rtdb.firebaseio.com',
    storageBucket: 'trial-server-paid.appspot.com',
    androidClientId: '306406055777-gi79l359gtm768mp9ss3i0ak75vcl1u8.apps.googleusercontent.com',
    iosClientId: '306406055777-t1h3ebi4dbbc9f2907p3pru94mdc9idp.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginsignup',
  );
}
