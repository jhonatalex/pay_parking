import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_parking/data/login_firebase/auth_firebase.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/error_snackbar.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signIn() async {
    try {
      await const AuthFirebase().signInWithEmail(
        emailController.text.trim(),
        passwordController.text,
      );
      Get.offNamed(RouteNames.verifyEmail); // home ASI NAVEGO
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(ErrorSnackbar(e.message ?? e.code));
      print(
        emailController.text.trim() + " - " + passwordController.text,
      );
    }
  }

/*
  String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value))
      return 'Enter Valid Email Id!!!';
    else {
      return null;
    }
  }

  */

  String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Password is empty!!!';
    }
    return null;
  }
}
