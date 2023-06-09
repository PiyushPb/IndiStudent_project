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
    apiKey: 'AIzaSyDmL_uJgAxALF33KO3zqPs5Sun2lOeqoL4',
    appId: '1:1017108580901:web:eb898cb8b4678935fc4dcc',
    messagingSenderId: '1017108580901',
    projectId: 'indistudent-277b1',
    authDomain: 'indistudent-277b1.firebaseapp.com',
    storageBucket: 'indistudent-277b1.appspot.com',
    measurementId: 'G-Q649ZVQ0TM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1wHCrwkhcT7OR60cOhU31_PthHJFYb4s',
    appId: '1:1017108580901:android:4aa3a9b9de9d3ceffc4dcc',
    messagingSenderId: '1017108580901',
    projectId: 'indistudent-277b1',
    storageBucket: 'indistudent-277b1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtDw3QqCxIqxzgEoZVOlC-iDwtOuQ9OiM',
    appId: '1:1017108580901:ios:949cd0d72c3e5266fc4dcc',
    messagingSenderId: '1017108580901',
    projectId: 'indistudent-277b1',
    storageBucket: 'indistudent-277b1.appspot.com',
    iosClientId: '1017108580901-mref0af2not6v5hoo9sr3s16fks171ab.apps.googleusercontent.com',
    iosBundleId: 'com.example.indistudent',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtDw3QqCxIqxzgEoZVOlC-iDwtOuQ9OiM',
    appId: '1:1017108580901:ios:949cd0d72c3e5266fc4dcc',
    messagingSenderId: '1017108580901',
    projectId: 'indistudent-277b1',
    storageBucket: 'indistudent-277b1.appspot.com',
    iosClientId: '1017108580901-mref0af2not6v5hoo9sr3s16fks171ab.apps.googleusercontent.com',
    iosBundleId: 'com.example.indistudent',
  );
}
