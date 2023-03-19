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
    apiKey: 'AIzaSyC1d728l-Wh_b2lB2nawqb_GBx8_RSpOzM',
    appId: '1:685628113620:web:9d7313a67384d4bf2a3141',
    messagingSenderId: '685628113620',
    projectId: 'kamus-bugis-f1467',
    authDomain: 'kamus-bugis-f1467.firebaseapp.com',
    storageBucket: 'kamus-bugis-f1467.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArFHyXWzSE6qom_kVFqG38AVykcd_Vh2o',
    appId: '1:685628113620:android:05a5a69cc9ff74e62a3141',
    messagingSenderId: '685628113620',
    projectId: 'kamus-bugis-f1467',
    storageBucket: 'kamus-bugis-f1467.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-N4J2y8E_F2ZHbSd92hAjhtv2wCjviIg',
    appId: '1:685628113620:ios:f281dcdafd6f00c82a3141',
    messagingSenderId: '685628113620',
    projectId: 'kamus-bugis-f1467',
    storageBucket: 'kamus-bugis-f1467.appspot.com',
    iosClientId: '685628113620-9eiaucbqbis611557bsah8urdrpfvqf1.apps.googleusercontent.com',
    iosBundleId: 'com.example.kamusBugis',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-N4J2y8E_F2ZHbSd92hAjhtv2wCjviIg',
    appId: '1:685628113620:ios:f281dcdafd6f00c82a3141',
    messagingSenderId: '685628113620',
    projectId: 'kamus-bugis-f1467',
    storageBucket: 'kamus-bugis-f1467.appspot.com',
    iosClientId: '685628113620-9eiaucbqbis611557bsah8urdrpfvqf1.apps.googleusercontent.com',
    iosBundleId: 'com.example.kamusBugis',
  );
}
