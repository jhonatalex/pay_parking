import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/login_main/intro_controller.dart';
import 'package:pay_parking/ui/pages/login_main/login_main_controller.dart';

class IntroBinding implements Bindings {
  const IntroBinding();

  @override
  void dependencies() {
    Get.lazyPut<IntroScreenController>(() => IntroScreenController());
  }
}
