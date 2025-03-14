// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAbs7ARXCN_ylUNm5RybTWLPoVe3LVZZHY',
    appId: '1:138495409815:web:236066585192d7f66a73d2',
    messagingSenderId: '138495409815',
    projectId: 'firebase-crud-01',
    authDomain: 'fir-crud-01-c200e.firebaseapp.com',
    storageBucket: 'firebase-crud-01.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8uoKl2hF7QvkCb43Lhh1r5wXHbcyZ_sU',
    appId: '1:138495409815:android:505bde0124896e206a73d2',
    messagingSenderId: '138495409815',
    projectId: 'firebase-crud-01',
    storageBucket: 'firebase-crud-01.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBePUXIZ_ttURYMPOWSd_cyOa74TuFjRZI',
    appId: '1:138495409815:ios:22a59d04f3571d036a73d2',
    messagingSenderId: '138495409815',
    projectId: 'firebase-crud-01',
    storageBucket: 'firebase-crud-01.firebasestorage.app',
    iosBundleId: 'com.example.crudProject1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBePUXIZ_ttURYMPOWSd_cyOa74TuFjRZI',
    appId: '1:138495409815:ios:22a59d04f3571d036a73d2',
    messagingSenderId: '138495409815',
    projectId: 'firebase-crud-01',
    storageBucket: 'firebase-crud-01.firebasestorage.app',
    iosBundleId: 'com.example.crudProject1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAbs7ARXCN_ylUNm5RybTWLPoVe3LVZZHY',
    appId: '1:138495409815:web:eac70e17276b99406a73d2',
    messagingSenderId: '138495409815',
    projectId: 'firebase-crud-01',
    authDomain: 'fir-crud-01-c200e.firebaseapp.com',
    storageBucket: 'firebase-crud-01.firebasestorage.app',
  );
}
