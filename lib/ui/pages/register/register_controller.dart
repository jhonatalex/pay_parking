import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pay_parking/data/login_firebase/auth_firebase.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/error_snackbar.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void singUp() async {
    try {
      await const AuthFirebase().createUserWithEmail(
        emailController.text.trim(),
        passwordController.text,
      );
      Get.offNamed(RouteNames.loginMain); //ASI NAVEGO
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(ErrorSnackbar(e.message ?? e.code));
    }
  }
/*
  void signIn() {
    Get.showOverlay(
      asyncFunction: () async {
        try {
          await const AuthFirebase().signInWithEmail(
            emailController.text.trim(),
            passwordController.text,
          );
          Get.offNamed(RouteNames.home);
        } on FirebaseAuthException catch (e) {
          Get.showSnackbar(ErrorSnackbar(e.message ?? e.code));
        }
      },
    );
  }
  */
}
