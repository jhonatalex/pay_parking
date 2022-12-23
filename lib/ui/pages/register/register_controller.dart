import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pay_parking/data/login_firebase/auth_repositoryAbst.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/error_snackbar.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _authRepository = Get.find<AuthRepository>();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void singUp() async {
    if (validateEmail(emailController.text.trim())) {
      if (validatePassword(passwordController.text)) {
        try {
          await _authRepository.createUserWithEmail(
            emailController.text.trim(),
            passwordController.text,
          );

          Get.offNamed(RouteNames.home); //ASI NAVEGO
        } on FirebaseAuthException catch (e) {
          Get.showSnackbar(ErrorSnackbar(e.message ?? e.code));
        }
      } else {
        Get.showSnackbar(const ErrorSnackbar("Favor Ingrese una  Contraseña"));
      }
    } else {
      Get.showSnackbar(const ErrorSnackbar("Favor Ingrese un Email Valido"));
    }
  }

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool validatePassword(String value) {
    if (value.trim().isEmpty) {
      return false;
    }
    return true;
  }
}
