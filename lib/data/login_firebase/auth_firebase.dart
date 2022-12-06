import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';

final currentUser = FirebaseAuth.instance.currentUser!;

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

// ignore: todo
//TODO RESET EMAIL GOOGLE FACE

}
