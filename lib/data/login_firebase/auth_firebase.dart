import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthFirebase implements AuthRepository {
  const AuthFirebase();

  @override
  Future<UserCredential> signInWithEmail(
    final String username,
    final String password,
  ) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: username,
      password: password,
    );
  }

  @override
  Future<UserCredential> createUserWithEmail(
    final String username,
    final String password,
  ) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: username,
      password: password,
    );
  }

  Future<void> forgotPasswordWithEmail(
    final String username,
  ) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: username);
  }

  //GOOGLE
  @override
  Future<UserCredential> signInGoogle(googleAuth) {
    return FirebaseAuth.instance.signInWithCredential(
      GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
    );
  }
}
