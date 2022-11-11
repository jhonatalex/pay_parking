import 'package:get/get.dart';
import 'package:pay_parking/app/controllers/auth_controller.dart';
import 'package:pay_parking/ui/pages/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  const SplashBinding();

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(authController: Get.find<AuthController>()),
    );
  }
}
