import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pay_parking/data/login_firebase/auth_firebase.dart';
import 'package:pay_parking/ui/routes/route_names.dart';
import 'package:pay_parking/ui/widgets/error_snackbar.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

/*
  void resetPassword() async {
    try {
      await const AuthFirebase().forgotPasswordWithEmail(
        emailController.text.trim(),
      );
      //Get.offNamed(RouteNames.loginMain);
      print("hola");
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(ErrorSnackbar(e.message ?? e.code));
      
    }
  }*/
  void resetPassword() async {
    try {
      await const AuthFirebase()
          .forgotPasswordWithEmail(emailController.text.trim());
      Get.showSnackbar(
          const ErrorSnackbar("Correo de recuperación de contraseña enviado"));
    } on FirebaseAuthException catch (e) {
      //Get.showSnackbar(ErrorSnackbar(e.message ?? e.code));

      //como conosco el error y sé el mensaje solo lo tradusco antes de mostrarlo,
      //no se si sea buena idea.
      if (e.message ==
          "We have blocked all requests from this device due to unusual activity. Try again later.") {
        Get.showSnackbar(const ErrorSnackbar(
            "Hemos bloqueado todas las solicitudes de este dispositivo debido a actividad inusual. Vuelva a intentarlo más tarde."));

        Get.offNamed(RouteNames.signIn);
      }
    }
  }
}
