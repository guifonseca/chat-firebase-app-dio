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
    apiKey: 'AIzaSyDKtIL3N5H8pdRxPXXhZtyfnyqXjdyccAg',
    appId: '1:835909115684:web:05e3a4705f48bdcceb5db1',
    messagingSenderId: '835909115684',
    projectId: 'fir-app-dio',
    authDomain: 'fir-app-dio.firebaseapp.com',
    storageBucket: 'fir-app-dio.appspot.com',
    measurementId: 'G-5ZBHR6Q2BS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAx01EDvdp6FqHv40mluy4N7vEfWcaKmzw',
    appId: '1:835909115684:android:ffdb3b1dc9cc0a2eeb5db1',
    messagingSenderId: '835909115684',
    projectId: 'fir-app-dio',
    storageBucket: 'fir-app-dio.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEPhkbtCmt4H8MuExx0Ebw4FjcpVwV9Ms',
    appId: '1:835909115684:ios:f85949e0493d9b39eb5db1',
    messagingSenderId: '835909115684',
    projectId: 'fir-app-dio',
    storageBucket: 'fir-app-dio.appspot.com',
    iosBundleId: 'com.guilhermesantos.dioproject.firebaseappdio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEPhkbtCmt4H8MuExx0Ebw4FjcpVwV9Ms',
    appId: '1:835909115684:ios:f85949e0493d9b39eb5db1',
    messagingSenderId: '835909115684',
    projectId: 'fir-app-dio',
    storageBucket: 'fir-app-dio.appspot.com',
    iosBundleId: 'com.guilhermesantos.dioproject.firebaseappdio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKtIL3N5H8pdRxPXXhZtyfnyqXjdyccAg',
    appId: '1:835909115684:web:5a2eb5733288964eeb5db1',
    messagingSenderId: '835909115684',
    projectId: 'fir-app-dio',
    authDomain: 'fir-app-dio.firebaseapp.com',
    storageBucket: 'fir-app-dio.appspot.com',
    measurementId: 'G-WVKMC1BQ82',
  );

}