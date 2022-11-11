import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../routes/route_names.dart';

class LoginMainController extends GetxController {
  void goToLogin() {
    Get.offNamed(RouteNames.signIn); //ASI SE NAVEGA CON GETX
  }

  void goToRegister() {
    Get.offNamed(RouteNames.register); //ASI SE NAVEGA CON GETX
  }
}
