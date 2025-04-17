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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCvdJ_yVa_22Bumwl48G5Rmm2_vyKl4oag',
    appId: '1:835037087080:web:fce4d4030c2f9fe83102dd',
    messagingSenderId: '835037087080',
    projectId: 'fir-project-64dce',
    authDomain: 'fir-project-64dce.firebaseapp.com',
    storageBucket: 'fir-project-64dce.firebasestorage.app',
    measurementId: 'G-9QP5NDH36G',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAehyhPl2JrFkVo32VHgjCPjb8zrdx-mZI',
    appId: '1:835037087080:ios:7b3f41d66550d35e3102dd',
    messagingSenderId: '835037087080',
    projectId: 'fir-project-64dce',
    storageBucket: 'fir-project-64dce.firebasestorage.app',
    iosBundleId: 'com.example.firebaseProjects',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCvdJ_yVa_22Bumwl48G5Rmm2_vyKl4oag',
    appId: '1:835037087080:web:2f6fa9e88b5bfe573102dd',
    messagingSenderId: '835037087080',
    projectId: 'fir-project-64dce',
    authDomain: 'fir-project-64dce.firebaseapp.com',
    storageBucket: 'fir-project-64dce.firebasestorage.app',
    measurementId: 'G-EZ8V02Z3EB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvH1ZLcYAlZe_t1rXylYP7UpbAQDRpAkg',
    appId: '1:835037087080:android:3c8a4bade28bf5ec3102dd',
    messagingSenderId: '835037087080',
    projectId: 'fir-project-64dce',
    storageBucket: 'fir-project-64dce.firebasestorage.app',
  );

}