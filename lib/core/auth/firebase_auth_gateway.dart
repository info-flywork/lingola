import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../config/firebase_options.dart';

class FirebaseAuthResult {
  const FirebaseAuthResult({
    required this.idToken,
    this.email,
    this.displayName,
    this.avatarUrl,
  });

  final String idToken;
  final String? email;
  final String? displayName;
  final String? avatarUrl;
}

/// Google / Apple → Firebase Auth → Firebase ID token (backend doğrular).
abstract final class FirebaseAuthGateway {
  static var _googleReady = false;

  static Future<void> ensureGoogleInitialized() async {
    if (_googleReady) return;
    await GoogleSignIn.instance.initialize(
      clientId: defaultTargetPlatform == TargetPlatform.iOS
          ? FirebaseOptionsConfig.googleIosClientId
          : null,
      serverClientId: FirebaseOptionsConfig.googleServerClientId,
    );
    _googleReady = true;
  }

  static Future<FirebaseAuthResult> signInWithGoogle() async {
    await ensureGoogleInitialized();
    final account = await GoogleSignIn.instance.authenticate();
    final googleIdToken = account.authentication.idToken;
    if (googleIdToken == null || googleIdToken.isEmpty) {
      throw StateError(
        'Google idToken missing — Firebase Console’a debug SHA-1 ekle',
      );
    }

    final credential = GoogleAuthProvider.credential(idToken: googleIdToken);
    final userCred =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCred.user;
    if (user == null) throw StateError('Firebase Google sign-in failed');

    final firebaseToken = await user.getIdToken();
    if (firebaseToken == null || firebaseToken.isEmpty) {
      throw StateError('Firebase idToken missing');
    }

    return FirebaseAuthResult(
      idToken: firebaseToken,
      email: user.email ?? account.email,
      displayName: user.displayName ?? account.displayName,
      avatarUrl: user.photoURL ?? account.photoUrl,
    );
  }

  static Future<FirebaseAuthResult> signInWithApple() async {
    final rawNonce = _randomNonce();
    final nonce = _sha256ofString(rawNonce);

    final apple = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final appleToken = apple.identityToken;
    if (appleToken == null || appleToken.isEmpty) {
      throw StateError('Apple identityToken missing');
    }

    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase not initialized');
    }

    final oauth = OAuthProvider('apple.com').credential(
      idToken: appleToken,
      rawNonce: rawNonce,
      accessToken: apple.authorizationCode,
    );
    final userCred = await FirebaseAuth.instance.signInWithCredential(oauth);
    final user = userCred.user;
    if (user == null) throw StateError('Firebase Apple sign-in failed');

    final firebaseToken = await user.getIdToken();
    if (firebaseToken == null || firebaseToken.isEmpty) {
      throw StateError('Firebase idToken missing');
    }

    final fullName = [
      apple.givenName,
      apple.familyName,
    ].whereType<String>().where((s) => s.trim().isNotEmpty).join(' ');

    return FirebaseAuthResult(
      idToken: firebaseToken,
      email: user.email ?? apple.email,
      displayName: user.displayName ?? (fullName.isEmpty ? null : fullName),
      avatarUrl: user.photoURL,
    );
  }

  static Future<void> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
    } catch (_) {}
    try {
      await FirebaseAuth.instance.signOut();
    } catch (_) {}
  }

  static String _randomNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  static String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    return sha256.convert(bytes).toString();
  }
}
