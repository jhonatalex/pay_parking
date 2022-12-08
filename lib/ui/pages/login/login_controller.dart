import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pay_parking/data/login_firebase/auth_repositoryImp.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/error_snackbar.dart';

import '../../../data/login_firebase/auth_repositoryAbst.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _authRepository = Get.find<AuthRepository>();

  final error = Rx<String?>(null);
  final isLoading = RxBool(false);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signIn() async {
    try {
      isLoading.value = true;
      error.value = null;
      await _authRepository.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }

/*
    try {
      await _authRepository.signInWithEmail(
        emailController.text.trim(),
        passwordController.text,
      );
      Get.offNamed(RouteNames.verifyEmail);
      //Get.offNamed(RouteNames.home); // home ASI NAVEGO

    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(ErrorSnackbar(e.message ?? e.code));
    }
  }


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
