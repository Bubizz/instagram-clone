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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC3cJHo6EKdI06KFdrAl-gj-dlF-LAYphs',
    appId: '1:702233399588:web:537b69153ed567be8f63b1',
    messagingSenderId: '702233399588',
    projectId: 'instagram-fced1',
    authDomain: 'instagram-fced1.firebaseapp.com',
    storageBucket: 'instagram-fced1.appspot.com',
    measurementId: 'G-7XQLCYZ7E0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPlUHLUBhp-e2BEIMJ2_Vf-amDydTBMSo',
    appId: '1:702233399588:android:af6ba9647014be248f63b1',
    messagingSenderId: '702233399588',
    projectId: 'instagram-fced1',
    storageBucket: 'instagram-fced1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmFymrBKAPKLCLeRDLUYqMPthcRqO9Dls',
    appId: '1:702233399588:ios:57b471053357266e8f63b1',
    messagingSenderId: '702233399588',
    projectId: 'instagram-fced1',
    storageBucket: 'instagram-fced1.appspot.com',
    androidClientId: '702233399588-321c8d88ugeqpg3ipob1phjuhfikqs2u.apps.googleusercontent.com',
    iosClientId: '702233399588-vfqt56q5feq9tclfh1a79c7ukmneia8p.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagram',
  );
}
