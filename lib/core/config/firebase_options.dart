import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

/// Firebase apps: Android + iOS (`com.flywork.lingolaapp`).
abstract final class FirebaseOptionsConfig {
  static const android = FirebaseOptions(
    apiKey: 'AIzaSyCrbIwe99yZ6ynuo4AzOHkXRu1octXOeYk',
    appId: '1:963261267239:android:f1e8cf1d32ecf140a0fd02',
    messagingSenderId: '963261267239',
    projectId: 'lingola-66a0a',
    storageBucket: 'lingola-66a0a.firebasestorage.app',
  );

  static const ios = FirebaseOptions(
    apiKey: 'AIzaSyDBBdB3KXb8426qPsn1ZO3tdOMsKDvZaIM',
    appId: '1:963261267239:ios:cbd9a1b2784c3dfca0fd02',
    messagingSenderId: '963261267239',
    projectId: 'lingola-66a0a',
    storageBucket: 'lingola-66a0a.firebasestorage.app',
    iosBundleId: 'com.flywork.lingolaapp',
    iosClientId:
        '963261267239-7b2f514cmbgfoak6ne2s77s3kc18mdru.apps.googleusercontent.com',
  );

  /// Web client ID (idToken / serverClientId for Google Sign-In).
  static const googleServerClientId =
      '963261267239-j7do1ps29c4i0oj4n1q7d8rnss7m19nr.apps.googleusercontent.com';

  /// iOS OAuth client from GoogleService-Info.plist CLIENT_ID.
  static const googleIosClientId =
      '963261267239-7b2f514cmbgfoak6ne2s77s3kc18mdru.apps.googleusercontent.com';

  static FirebaseOptions? get currentPlatform {
    if (kIsWeb) return null;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        return null;
    }
  }
}
