import 'package:get/get.dart';
import 'package:pay_parking/ui/pages/login/login_controller.dart';
import 'package:pay_parking/ui/pages/login_main/login_main_controller.dart';

class LoginBinding implements Bindings {
  const LoginBinding();

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
