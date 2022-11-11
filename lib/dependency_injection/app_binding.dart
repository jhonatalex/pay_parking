import 'package:get/get.dart';
import 'package:pay_parking/app/controllers/app_controller.dart';

import '../app/controllers/auth_controller.dart';

class AppBinding implements Bindings {
  const AppBinding();

  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<AppController>(AppController(), permanent: true);
  }
}
