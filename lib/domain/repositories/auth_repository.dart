import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<UserCredential> signInWithEmail(
    final String username,
    final String password,
  );

  Future<UserCredential> createUserWithEmail(
    final String username,
    final String password,
  );

  Future<UserCredential> signInGoogle(googleAuth);
}
