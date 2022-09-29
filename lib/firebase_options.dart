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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVnRO9NVXmsM5z6ZCY7LvIlYOsDLeBq-0',
    appId: '1:862337721493:android:2fd528a38fc00312ce279c',
    messagingSenderId: '862337721493',
    projectId: 'shopapp-e1591',
    storageBucket: 'shopapp-e1591.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBr3sTESLckRzDqvYrvg2dp0yA2--4Yqrs',
    appId: '1:862337721493:ios:d2fafa6da2d9222ece279c',
    messagingSenderId: '862337721493',
    projectId: 'shopapp-e1591',
    storageBucket: 'shopapp-e1591.appspot.com',
    androidClientId: '862337721493-01gtekgg6j3elgqu4dcgtpcqorgg3ebu.apps.googleusercontent.com',
    iosClientId: '862337721493-ecj0klhpl0aahe4tebos716nkrn1mjq4.apps.googleusercontent.com',
    iosBundleId: 'kz.yerasyl.equipment-project',
  );
}
