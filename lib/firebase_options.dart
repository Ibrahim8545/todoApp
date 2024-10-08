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
    apiKey: 'AIzaSyAY_rR3IEUFu6DFdd75jiPAczbduJKVZQA',
    appId: '1:389302379169:web:c1a97470a4aa084b8c46e0',
    messagingSenderId: '389302379169',
    projectId: 'todo-fd70a',
    authDomain: 'todo-fd70a.firebaseapp.com',
    storageBucket: 'todo-fd70a.appspot.com',
    measurementId: 'G-12V3BFVF76',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtQq5QqtjMy7k0QjhqSab2NJfgI7Ywb8Y',
    appId: '1:389302379169:android:9ac57a35d417f06a8c46e0',
    messagingSenderId: '389302379169',
    projectId: 'todo-fd70a',
    storageBucket: 'todo-fd70a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDenossBMwUaprwwrYM6N0DZAnSQYJl6fM',
    appId: '1:389302379169:ios:fb616dd05e02cb6e8c46e0',
    messagingSenderId: '389302379169',
    projectId: 'todo-fd70a',
    storageBucket: 'todo-fd70a.appspot.com',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDenossBMwUaprwwrYM6N0DZAnSQYJl6fM',
    appId: '1:389302379169:ios:fb616dd05e02cb6e8c46e0',
    messagingSenderId: '389302379169',
    projectId: 'todo-fd70a',
    storageBucket: 'todo-fd70a.appspot.com',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAY_rR3IEUFu6DFdd75jiPAczbduJKVZQA',
    appId: '1:389302379169:web:6c39d3fea88c2e088c46e0',
    messagingSenderId: '389302379169',
    projectId: 'todo-fd70a',
    authDomain: 'todo-fd70a.firebaseapp.com',
    storageBucket: 'todo-fd70a.appspot.com',
    measurementId: 'G-EY6YSRK9J5',
  );

}